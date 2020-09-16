class BooksController < ApplicationController

  get '/books' do
    @user = User.find_by(id: current_user.id)
    erb :'/books/index'
  end

  get '/books/new' do
  end

  post '/books' do
  end

  get '/books/:id' do
  end

end
