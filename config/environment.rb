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
# require 'net/http'
# require 'json'

# client_id = '643e92f4d76983c07a37'
# client_secret = '1eab7f6ddf929ef4dc42b0a74db7f5d1'
# api_url = URI.parse('https://api.artsy.net/api/tokens/xapp_token')
# response = Net::HTTP.post_form(api_url, client_id: client_id, client_secret: client_secret)
# xapp_token = JSON.parse(response.body)['token']




#SET UP API PARAMS
# API_KEY = https://api.artsy.net/api


# require 'ostruct'

# # Setup global parameters
# API_KEY = "AIzaSyBaJUNgMSEae4z_X1lRQI-2PjqwfamHNOk"
# GoogleMapsService.configure do |config|
#   config.key = API_KEY
#   config.retry_timeout = 20
#   config.queries_per_second = 10
# end

# # Initialize client using global parameters
# GMAPS = GoogleMapsService::Client.newg