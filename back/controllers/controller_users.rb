def get_payload(request)
  request.body.rewind
  JSON.parse(request.body.read, symbolize_names: true)
end

def register_user(_response, request)
  payload = get_payload(request)
  candidate = User.find_by(username: payload[:username])

  return { status: :error_user_exists }.to_json if candidate

  User.create(username: payload[:username],
              role_id: payload[:role_id],
              last_compliment_id: payload[:last_compliment_id],
              password: payload[:password])

  user = User.find_by(username: payload[:username])
  session[:user_id] = user.id

  { status: :user_succesfully_register }.to_json
end

def login_user(_response, request)
  payload = get_payload(request)
  user = User.find_by(username: payload[:username])

  return { status: :error_user_not_exists }.to_json unless user

  return { status: :error_wrong_password }.to_json unless user.authenticate(payload[:password])

  session[:user_id] = user.id
  user.attributes.to_json
end

def update_user(_response, request)
  payload = get_payload(request)

  candidate = User.find_by(username: payload[:username])

  return { status: :error_you_are_not_logged_in }.to_json unless current_user

  return { status: :error_access_not_allowed }.to_json unless current_user.admin?

  return { status: :error_user_not_exists }.to_json unless candidate

  candidate_params = %i[username role_id last_compliment_id password]
  candidate.update!(payload.slice(*candidate_params))
  candidate.attributes.to_json
end

def delete_user(_response, request)
  payload = get_payload(request)

  candidate = User.find_by(username: payload[:username])

  return { status: :error_you_are_not_logged_in }.to_json unless current_user

  return { status: :error_access_not_allowed }.to_json unless current_user.admin?

  return { status: :error_user_not_exists }.to_json unless candidate

  candidate.destroy
  { status: :user_succesfully_deleted }.to_json
end

def get_all_users(_response, _request)
  return { status: :error_access_not_allowed }.to_json unless current_user.admin?

  User.all.to_json
end

def get_my_user(_response, _request)
  return { status: :error_you_are_not_logged_in }.to_json unless current_user

  current_user.to_json
end

def log_out(_response, _request)
  return { status: :you_are_not_logged_in }.to_json unless current_user

  session[:user_id] = nil

  { status: :succesfully_logout }.to_json
end

# def login_in?
#   user = User.find_by(id: session[:user_id])

#   false unless user
# end

# def admin?
#   user = User.find_by(id: session[:user_id])

#   return false unless user

#   false unless user.role_id == 1
# end

def current_user
  @current_user ||= User.find_by_id session[:user_id]
end

def logged_in?
  !!current_user
end

def admin?
  current_user&.role_id == 1
end
