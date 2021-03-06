# ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
require 'sinatra/base'
require 'rack-flash'
# Bundler.require(:default, ENV['SINATRA_ENV'])
Bundler.require 

configure :development do
  ENV['SINATRA_ENV'] ||= "development"

  require 'bundler/setup'
  Bundler.require(:default, ENV['SINATRA_ENV'])

  ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
  )
end

configure :production do
  db = URI.parse(ENV['HEROKU_POSTGRESQL_BRONZE_URL'] || 'postgres://localhost/mydb')

  ActiveRecord::Base.establish_connection(
    :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host     => db.host,
    :username => db.user,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'utf8'
  )
end

# ActiveRecord::Base.establish_connection(
#   :adapter => "sqlite3",
#   :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
# )
# ActiveRecord::Base.establish_connection(
#   :adapter => "postgresql",
#   :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
# )

require './app/controllers/application_controller'
require_all 'app'
require 'net/http'
require 'json'
require 'hyperclient'
# require 'httparty'

