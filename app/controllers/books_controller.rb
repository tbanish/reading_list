class BooksController < ApplicationController

  get '/books' do
    if !logged_in?
      redirect "/login"
    else
      @user = User.find_by(id: current_user.id)
      erb :'/books/index'
    end
  end

  get '/books/new' do
    if !logged_in?
      redirect "/login"
    else
      @user = User.find_by(id: current_user.id)
      erb :'/books/new'
    end
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
    @user = User.find_by(id: current_user.id)
    if !logged_in?
      redirect "/login"
    elsif @book.user_id == current_user.id
      erb :'/books/show'
    else
      redirect "/users/#{current_user.id}"
    end
  end

  get '/books/:id/edit' do
    @book = Book.find_by(id: params[:id])
    if !logged_in?
      redirect "/login"
    elsif @book.user_id == current_user.id
      @user = User.find_by(id: current_user.id)
      erb :"/books/edit"
    else
      redirect "/users/#{current_user.id}"
    end
  end

  patch '/books/:id' do
    @book = Book.find_by(id: params[:id])
    if params[:title] != "" && params[:author] != ""
      @book.title = params[:title]
      @book.author = params[:author]
      @book.save
      redirect "/books/#{@book.id}"
    else
      redirect "/books/#{@book.id}/edit"
    end
  end

  delete '/books/:id' do
    @book = Book.find_by(id: params[:id])

    if !logged_in?
      redirect "/login"
    elsif @book.user_id == current_user.id
      @book.destroy
      redirect "/books"
    else
      redirect "/users/#{current_user.id}"
    end
  end
end
