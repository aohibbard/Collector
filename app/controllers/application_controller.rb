require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions 
    set :session_secret, "rrose_selavy"
    use Rack::Flash 
  end

  get "/" do
    erb :index
  end

  not_found do
    status 404
    erb :'error-page'
  end 

  helpers do 
    def logged_in?
      !!current_user 
    end 

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end 
    
  end 

end
