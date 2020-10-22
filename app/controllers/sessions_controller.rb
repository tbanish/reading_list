class SessionsController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :'/sessions/signup'
    else
      redirect "/users/#{current_user.id}"
    end
  end

  post '/signup' do
    if params[:name] != "" && params[:email] != "" && params[:password] != "" && !User.find_by(name: params[:name])
      @user = User.create(params)
      session[:id] = @user.id
      redirect "/users/#{@user.id}"
    else
      redirect "/signup"
    end
  end

  get '/login' do
    if !logged_in?
      erb :'/sessions/login'
    else
      redirect "/users/#{current_user.id}"
    end
  end

  post '/login' do
    @user = User.find_by(name: params[:name])
    if @user != nil && @user.authenticate(params[:password]) && params[:name] != "" && params[:password] != ""
      session[:id] = @user.id
      redirect "/users/#{current_user.id}"
    else
      redirect "/login"
    end
  end

  get '/logout' do
    @user = User.find_by(id: current_user.id)
    if logged_in?
      erb :'/sessions/logout'
    else
      redirect "/login"
    end
  end

  post '/logout' do
    session.clear
    redirect '/login'
  end

end
