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
    erb :'/sessions/login'
  end

  post '/login' do
    @user = User.find_by(name: params[:name])
    if @user.authenticate(params[:password]) && params[:name] != "" && params[:password] != ""
      session[:id] = @user.id
      redirect "/users/#{current_user.id}"
    else
      redirect "/login"
    end
  end

  get '/logout' do
    erb :'/sessions/logout'
  end

  post '/logout' do
    session.clear
    redirect '/login'
  end

end
