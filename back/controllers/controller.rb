def get_payload(request)
  request.body.rewind
  JSON.parse(request.body.read, symbolize_names: true)
end

def current_user
  # binding.irb
  @current_user ||= User.find_by_id cookies[:user_id]
end

def logged_in?
  !!current_user
end

def admin?
  current_user&.role_id == 1
end
