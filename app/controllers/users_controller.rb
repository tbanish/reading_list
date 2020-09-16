class UsersController < ApplicationController

  get '/users/:id' do
    @user = User.find_by(id: params[:id])
    if !logged_in?
      redirect "/login"
    elsif logged_in? && @user.id == current_user.id
      erb :"/users/show"
    else
      redirect "/users/#{current_user.id}"
    end
  end

end
