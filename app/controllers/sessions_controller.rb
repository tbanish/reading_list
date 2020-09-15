class SessionsController < ApplicationController

  get '/signup' do
    erb :'/sessions/signup'
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

end
