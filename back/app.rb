# myapp.rb
require 'sinatra'
require 'json'
require 'sinatra/activerecord'

Dir["#{__dir__}/models/*"].sort.each { |p| require p }
Dir["#{__dir__}/controllers/*"].sort.each { |p| require p }
Dir["#{__dir__}/routers/*"].sort.each { |p| require_relative p }

enable :sessions

set :database, { adapter: 'sqlite3', database: 'foo.sqlite3' }
# or set :database_file, "path/to/database.yml"
# Compliment.create(name: "govna", is_used: false)
# puts ActiveRecord::Base.connection.execute "select * from compliments where id=1"
