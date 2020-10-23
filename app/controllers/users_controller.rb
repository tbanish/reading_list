class UsersController < ApplicationController

  get '/users/:id' do
    @user = User.find_by(id: params[:id])
    if !logged_in?
      flash[:message] = "You need to log in to view this page."
      redirect "/login"
    elsif (logged_in? && @user == nil) || (logged_in? && @user.id != current_user.id)
      flash[:message] = "Click the links above to navigate the site."
      redirect "/users/#{current_user.id}"
    elsif logged_in? && @user.id == current_user.id
      erb :"/users/show"
    end
  end

end
