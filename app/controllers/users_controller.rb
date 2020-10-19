class UsersController < ApplicationController

  get '/users/:id' do
    @user = User.find_by(id: params[:id])
    if !logged_in?
      redirect "/login"
    elsif (logged_in? && @user == nil) || (logged_in? && @user.id != current_user.id)
      redirect "/users/#{current_user.id}"
    elsif logged_in? && @user.id == current_user.id
      erb :"/users/show"
    end
  end

end
