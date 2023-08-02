require 'sinatra'
require 'json'
require "sinatra/activerecord"

post '/api/compliments' do
    create_compliment(response, request)
end

get '/api/compliments/:id' do
    get_compliment(params["id"].to_i)
end
  
delete '/api/compliments/:id' do
    delete_compliment(params["id"].to_i)
end