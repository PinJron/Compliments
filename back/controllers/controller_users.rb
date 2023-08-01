def registerUser(response, request)
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
    response = {status: :UserSuccesfullyRegister}.to_json
  end
end

def loginUser(response, request)
  request.body.rewind
  payload = JSON.parse(request.body.read, symbolize_names: true)
  user = User.find_by(username: payload[:username])
  if !user
    response = {status: :ErrorUserNotExists}.to_json
  else
    user = user.authenticate(payload[:password])
    # puts user
    if user
      response = {status: :UserSuccesfullyLogin}.to_json
    else
      response = {status: :ErrorWrongPassword}.to_json
    end
  end
end

def getUsers(response, request)
  request = {status: :getUsers}.to_json
end