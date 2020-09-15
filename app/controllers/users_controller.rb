class UsersController < ApplicationController

  get '/users/:id' do
    @user = User.find_by(params)
    erb :"/users/show"
  end

end
