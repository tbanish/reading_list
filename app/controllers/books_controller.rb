class BooksController < ApplicationController

  get '/books' do
    @user = User.find_by(id: current_user.id)
    erb :'/books/index'
  end

  get '/books/new' do
    @user = User.find_by(id: current_user.id)
    erb :'/books/new'
  end

  post '/books' do
    if params[:title] != "" && params[:author] != ""
      @book = Book.new(params)
      @book.user_id = current_user.id
      @book.save
      redirect "/books/#{@book.id}"
    else
      redirect "/books/new"
    end
  end

  get '/books/:id' do
    @book = Book.find_by(id: params[:id])
    if @book.user_id == current_user.id
      erb :'/books/show'
    else
      redirect "/users/#{current_user.id}"
    end
  end

end
