class UsersController < ApplicationController

  get '/users/:id' do
    @user = User.find_by(params)
    session[:id] = @user.id
    erb :"/users/show"
  end

end
