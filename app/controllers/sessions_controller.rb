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
    if valid_sign_up_form_submission && unique_name
      @user = User.create(params)
      log_user_in
      redirect "/users/#{@user.id}"
    elsif !unique_name
      flash[:message] = "Name already in use.  Please choose another."
      redirect "/signup"
    elsif !valid_sign_up_form_submission
      fill_out_all_fields
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
    if user_exists && password_is_authenticated && valid_login_form_submission
      log_user_in
      redirect "/users/#{current_user.id}"
    else
      flash[:message] = "Your login credentials are invalid.  Please try again."
      redirect "/login"
    end
  end

  get '/logout' do
    if logged_in?
      find_user_by_current_user_id
      erb :'/sessions/logout'
    else
      log_in_to_view_page
      redirect "/login"
    end
  end

  post '/logout' do
    log_user_out
    redirect '/login'
  end

end
