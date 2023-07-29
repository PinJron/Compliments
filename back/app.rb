# myapp.rb
require 'sinatra'
require 'json'
require "sinatra/activerecord"

id = 1

Dir["#{__dir__}/models/*"].each {|p| require p}

set :database, {adapter: "sqlite3", database: "foo.sqlite3"}
# or set :database_file, "path/to/database.yml"
# Compliment.create(name: "govna", is_used: false)
# puts ActiveRecord::Base.connection.execute "select * from compliments where id=1"
get '/api/compliments' do
  
  compliment = Compliment.find_by(id:)
  id += 1
  if compliment 
    {status: :ok}.merge!(compliment.attributes).to_json
  else
    {status: :not_found}.to_json
  end
end
post '/api/compliments' do
  compliment = Compliment.create("name": "mama")
end
