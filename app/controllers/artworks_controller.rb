class ArtworksController < ApplicationController


    get "/artworks" do 
        if logged_in?
            @artworks = @current_user.artworks 
            erb :'artworks/index.html'
        else
            redirect '/login'
        end 
    end 

    get "/artworks/new" do 
        if logged_in?
            erb :'/artworks/new.html'
        else 
            redirect '/login'
        end 
    end

    get "/artworks/sort_year" do 
        if logged_in?
            @artworks = current_user.artworks.sort_by{|artwork| artwork[:year]}
            erb :'artworks/index.html'
        else
            redirect '/login'
        end 
    end 

    # # this should be in Artist controller
    # get "/artworks/sort_by_name" do
    #     if logged_in?
    #         artists = current_user.artists.each do |artist|
    #             artist.name_sorter
    #         end 
    #         @artworks = artists.sort_by{|artist| artist[:name_sorted]}
    #         erb :'artworks/index.html'
    #     else
    #         redirect '/login'
    #     end 
    # end 

    get "/artworks/:id" do 
        if logged_in?
            @artwork = Artwork.find_by_id(params[:id])
            erb :"artworks/show_artwork.html"
        else
            redirect '/login'
        end 
    end 

    get '/artworks/:id/edit' do 
        if logged_in? 
            @artwork = Artwork.find_by_id(params[:id])
            if @artwork && @artwork.user == current_user 
                erb :'/artworks/edit.html'
            else 
                redirect '/artworks'
            end
        else 
            redirect '/login'
        end 
    end 

    post "/artwork" do 
        if params[:artist][:name] == "" || params[:artwork][:title] == "" || params[:artwork][:year] == ""
            redirect "/artworks/new"
        else 
            @artwork = Artwork.create(params[:artwork])
            # Capitalize artist first & last name to standardize
            @artwork.artist = Artist.find_or_create_by(name: params[:artist][:name])
            #assign user id to artwork
            @artwork.user_id = current_user.id 
            @artwork.save
            redirect "/artworks/#{@artwork.id}"
        end 
    end 

    patch "/artworks/:id" do 
        if params[:artist][:name] == "" || params[:artwork][:title] == "" || params[:artwork][:year] == ""
            redirect "/artworks/edit"
        else 
            @artwork = Artwork.find_by_id(params[:id])
            @artwork.update(params[:artwork])
            @artwork.artist = Artist.find_or_create_by(name: params[:artist][:name])
            @artwork.save
            redirect "/artworks/#{@artwork.id}"
        end 
    end 


    delete '/artworks/:id/delete' do 
        if logged_in? 
            @artwork = Artwork.find_by_id(params[:id])
            if @artwork && @artwork.user == current_user
                @artwork.delete 
            end 
            redirect "/artworks"
        else 
            redirect "/login"
        end 
    end 


end 