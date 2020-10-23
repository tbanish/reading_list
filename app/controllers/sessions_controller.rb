class SessionsController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :'/sessions/signup'
    else
      flash[:message] = "You have already signed up."
      redirect "/users/#{current_user.id}"
    end
  end

  post '/signup' do
    if params[:name] != "" && params[:email] != "" && params[:password] != "" && !User.find_by(name: params[:name])
      @user = User.create(params)
      session[:id] = @user.id
      redirect "/users/#{@user.id}"
    else
      flash[:message] = "Please make sure all fields are filled out before submitting form."
      redirect "/signup"
    end
  end

  get '/login' do
    if !logged_in?
      erb :'/sessions/login'
    else
      flash[:message] = "You are already logged in."
      redirect "/users/#{current_user.id}"
    end
  end

  post '/login' do
    @user = User.find_by(name: params[:name])
    if @user != nil && @user.authenticate(params[:password]) && params[:name] != "" && params[:password] != ""
      session[:id] = @user.id
      redirect "/users/#{current_user.id}"
    else
      flash[:message] = "Your login credentials are invalid.  Please try again."
      redirect "/login"
    end
  end

  get '/logout' do
    if logged_in?
      @user = User.find_by(id: current_user.id)
      erb :'/sessions/logout'
    else
      flash[:message] = "You must log in to view this page."
      redirect "/login"
    end
  end

  post '/logout' do
    session.clear
    redirect '/login'
  end

end
