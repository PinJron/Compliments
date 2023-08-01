def registerUser(response, request)
  request.body.rewind
  payload = JSON.parse(request.body.read, symbolize_names: true)
  candidate = User.find_by(username: payload[:username])

  
  if candidate
    response = {status: :ErrorUserExists}.to_json
  else
    user = User.create("username": payload[:username],
      "role_id": payload[:role_id],
      "last_compliment_id": payload[:last_compliment_id] 
      )
    response = {status: :loginUser}.to_json
  end
end

def loginUser(response, request)
  login = {status: :loginUser}.to_json
end

def getUsers(response, request)
  request = {status: :getUsers}.to_json
end