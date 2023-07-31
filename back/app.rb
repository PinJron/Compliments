# myapp.rb
require 'sinatra'
require 'json'
require "sinatra/activerecord"
require_relative "controller.rb"
require_relative "router.rb"

Dir["#{__dir__}/models/*"].each {|p| require p}

set :database, {adapter: "sqlite3", database: "foo.sqlite3"}
# or set :database_file, "path/to/database.yml"
# Compliment.create(name: "govna", is_used: false)
# puts ActiveRecord::Base.connection.execute "select * from compliments where id=1"
