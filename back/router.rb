require 'sinatra'
require 'json'
require "sinatra/activerecord"

get '/api/compliments/:id' do
    # puts params["id"]
    getCompliment(params["id"].to_i)
end
  
post '/api/compliments' do
    createCompliment(response, request)
end
  
delete '/api/compliments/:id' do
  # binding.irb
  deleteCompliment(params["id"].to_i)
end

post '/api/users/register' do
    registerUser(response, request)
end

post '/api/users/login' do
    loginUser(response, request)
end

get '/api/users' do
    getUsers(response, request)
end