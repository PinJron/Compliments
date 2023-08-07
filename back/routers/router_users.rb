post '/api/users/register' do
  register_user(response, request)
end

get '/api/users/me' do
  get_my_user(response, request)
end

post '/api/users/login' do
  login_user(response, request)
end

patch '/api/users/update' do
  update_user(response, request)
end

delete '/api/users/delete' do
  delete_user(response, request)
end

get '/api/users/all' do
  get_all_users(response, request)
end

# delete '/api/users/delete' do
#     delete_all_users()
# end
