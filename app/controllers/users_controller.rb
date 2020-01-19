class UsersController < ApplicationController

    # # GET: /users
    # get "/users" do
    #   erb :"/users/index.html"
    # end
  
    # GET: /users/new
    get "/signup" do
      erb :"/users/signup.html"
    end
  
    get "/login" do 
      if !logged_in?
        erb :"/users/login.html"
      else
        redirect "/artworks"
      end 
    end 
  
    # show user page
    # get "/users/:id" do
    #   if logged_in? 
    #     @user = @current_user
    #     # we are defaulting to :id = 1 . Why?
    #     binding.pry
    #     erb :"/users/show.html"
    #   else 
    #     redirect "/login"
    #   end 
    # end
  
    get "/users/:id/edit" do
      erb :"users/edit.html"
    end
  
    #sign up 
    post "/signup" do 
      if params[:name] == "" || params[:email] == "" || params[:password] == ""
        #flash[:error] = "Please enter appropriate data into all fields."
        redirect '/signup'
      else 
        @user = User.new(:name => params[:name], :email => params[:email], :password => params[:password])
        if @user.save
          session[:user_id] = @user.id 
          # flash.now[:notice] = "Thanks for signing up!"
          redirect "/artworks"
        else 
          erb :'users/signup'
        end 
      end 
    end 
  
    post "/login" do 
      @user = User.find_by(:email => params[:email])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id 
        flash[:notice] = "Welcome back!"
        redirect "/artworks"
      else 
        redirect to '/login'
      end 
    end 
  
    # PATCH: /users/5
    patch "/users/:id" do
      redirect "/users/:id"
    end
  
    # DELETE: /users/5/delete
    delete "/users/:id/delete" do
      redirect "/users"
    end
  
    get '/logout' do 
      if logged_in?
        session.destroy 
        flash[:notice] = "Goodbye!"
        redirect '/login'
      else 
        redirect '/index'
      end 
    end 
  
  end 