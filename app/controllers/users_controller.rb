class UsersController < ApplicationController

  get '/users/:id' do
    @user = User.find_by(id: params[:id])
    if !logged_in?
      log_in_to_view_page
      redirect "/login"
    elsif (logged_in? && !user_exists) || (logged_in? && @user != current_user)
      flash[:message] = "Click the links above to navigate the site."
      redirect "/users/#{current_user.id}"
    elsif logged_in? && @user.id == current_user.id
      erb :"/users/show"
    end
  end
end
