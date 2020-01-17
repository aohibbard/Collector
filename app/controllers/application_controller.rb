require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions 
    set :session_secret, "rrose_selavy"
    #use Rack::Flash 
  end

  get "/" do
    # @stylesheet_link = "/stylesheets/not-logged-in.css"
    #   File.read(File.join('public', 'index.html'))
    erb :index
  end

  not_found do
    status 404
    erb :'error-page'
  end 

#   post "/artworks/:id/scramble" do 
#     if logged_in?
#         @artwork = Artwork.find_by_id(params[:id])
#         @artwork.year = "4991"
#         @artwork.save 
#         erb :'artworks/find_year.html'
#     else
#         redirect '/login'
#     end 
# end 

  helpers do 
    def logged_in?
      !!current_user 
    end 

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end 
    
  end 

end
