enable :sessions

def register_user(response, request)
  request.body.rewind
  payload = JSON.parse(request.body.read, symbolize_names: true)
  candidate = User.find_by(username: payload[:username])

  if candidate
    response = {status: :ErrorUserExists}.to_json
  else
    user = User.create("username": payload[:username],
      "role_id": payload[:role_id],
      "last_compliment_id": payload[:last_compliment_id],
      "password": payload[:password]
      )
    response = {status: :user_succesfully_register}.to_json
  end
end

def login_user(response, request)
  request.body.rewind
  payload = JSON.parse(request.body.read, symbolize_names: true)
  user = User.find_by(username: payload[:username])
  return { status: :error_user_not_exists}.to_json unless user

  return { status: :error_user_not_exists}.to_json unless user.authenticate(payload[:password])

  session[:user_id] = user.id
  user.attributes.to_json
end

def get_all_users(response, request)
  user_role = User.find_by(id: session[:loggedUserId]).role_id
  if user_role == 1
    response = User.all.to_json
  else
    response = {status: :error_access_not_allowed}.to_json
  end
end

def get_my_user(response, request)
  user = User.find_by(id: session[:loggedUserId])
  if user
    response = user.to_json
  else
    response = {status: :error_access_not_allowed}.to_json
  end
end