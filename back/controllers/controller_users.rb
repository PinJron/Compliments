def register_user(_response, request)
  request.body.rewind
  payload = JSON.parse(request.body.read, symbolize_names: true)
  candidate = User.find_by(username: payload[:username])

  return { status: :error_user_exists }.to_json unless candidate

  User.create(username: payload[:username],
              role_id: payload[:role_id],
              last_compliment_id: payload[:last_compliment_id],
              password: payload[:password])

  { status: :user_succesfully_register }.to_json
end

def login_user(_response, request)
  request.body.rewind
  payload = JSON.parse(request.body.read, symbolize_names: true)
  user = User.find_by(username: payload[:username])

  return { status: :error_user_not_exists }.to_json unless user

  return { status: :error_wrong_password }.to_json unless user.authenticate(payload[:password])

  session[:user_id] = user.id
  user.attributes.to_json
end

def update_user(_response, request)
  request.body.rewind
  payload = JSON.parse(request.body.read, symbolize_names: true)
  user = User.find_by(username: payload[:username])
  user_params = %i[username role_id last_compliment_id password]
  user.update!(payload.slice(*user_params))
  user.attributes.to_json
end

def delete_user(_response, request)
  request.body.rewind
  payload = JSON.parse(request.body.read, symbolize_names: true)
  candidate = User.find_by(username: payload[:username])
  user = User.find_by(id: session[:user_id])

  return { status: :error_user_not_exists }.to_json unless candidate

  return { status: :error_access_not_allowed }.to_json unless user.admin?

  candidate.destroy
  { status: :user_succesfully_deleted }.to_json
end

def get_all_users(_response, _request)
  user = User.find_by(id: session[:user_id])

  return { status: :error_access_not_allowed }.to_json unless user.admin?

  User.all.to_json
end

def get_my_user(_response, _request)
  user = User.find_by(id: session[:user_id])

  return { status: :error_access_not_allowed }.to_json unless user

  user.to_json
end
