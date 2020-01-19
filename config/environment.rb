ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
require 'sinatra/base'
require 'rack-flash'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

require './app/controllers/application_controller'
require_all 'app'
require 'net/http'
require 'json'
require 'hyperclient'
# require 'httparty'

