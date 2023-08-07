require 'rack/unreloader'
require 'sinatra'
require 'json'
require 'sinatra/activerecord'

Unreloader = Rack::Unreloader.new { App }
require './app'
Unreloader
