require 'sinatra'
require 'json'
require "sinatra/activerecord"

get '/api/compliments/:id' do
    # puts params["id"]
    get_compliment(params["id"].to_i)
end
  
post '/api/compliments' do
    create_compliment(response, request)
end
  
delete '/api/compliments/:id' do
  # binding.irb
  delete_compliment(params["id"].to_i)
end

post '/api/users/register' do
    register_user(response, request)
end

post '/api/users/login' do
    login_user(response, request)
end

get '/api/users' do
    get_all_users(response, request)
end

get '/api/users/me' do
    get_my_user(response, request)
end