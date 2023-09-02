# myapp.rb
require 'sinatra'
require 'json'
require 'sinatra/activerecord'
require "sinatra/cookies"

Dir["#{__dir__}/models/*"].sort.each { |p| require p }
Dir["#{__dir__}/controllers/*"].sort.each { |p| require p }
Dir["#{__dir__}/routers/*"].sort.each { |p| require_relative p }

enable :sessions

set :root, File.dirname(__FILE__)
# binding.irb
set :public_folder, File.join(settings.root, '/public')

# set :database, { adapter: 'sqlite3', database: 'foo.sqlite3' }
# or set :database_file, "path/to/database.yml"
# puts ActiveRecord::Base.connection.execute "select * from compliments where id=1"
