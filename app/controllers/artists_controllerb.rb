class ArtistsController < ApplicationController

    get '/artists/:id' do
        if logged_in?
            # find with artsy api
            @artist = Artist.find_by(params)
            if 
                @artist.birthday != nil 
                erb :'/artists/show.html'
            else 
                # Query API if artist is not in sqlite
                @artist.api_request #remove slug
            # binding.pry
                erb :'/artists/show.html'
            end 
        else 
            redirect :'/login'
        end 
    end 

    get '/artists' do 
        if logged_in?
            erb :'/artists/index.html'
        else 
            redirect :'/login'
        end 
    end 

end 