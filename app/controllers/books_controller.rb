class BooksController < ApplicationController

  get '/books' do
    if !logged_in?
      log_in_to_view_page
      redirect "/login"
    else
      find_user_by_current_user_id
      erb :'/books/index'
    end
  end

  get '/books/new' do
    if !logged_in?
      log_in_to_view_page
      redirect "/login"
    else
      find_user_by_current_user_id
      erb :'/books/new'
    end
  end

  post '/books' do
    if valid_book_form_submission
      set_and_save_title_and_author
      redirect "/books/#{@book.id}"
    else
      fill_out_all_fields
      redirect "/books/new"
    end
  end

  get '/books/:id' do
    find_book_by_id

    if !logged_in?
      log_in_to_view_page
      redirect "/login"
    elsif book_exists && book_belongs_to_current_user
      find_user_by_current_user_id
      erb :'/books/show'
    else
      flash[:message] = "Click the 'View Reading List' link at the top of the page to view your books."
      redirect "/users/#{current_user.id}"
    end
  end

  get '/books/:id/edit' do
    find_book_by_id
    if !logged_in?
      log_in_to_view_page
      redirect "/login"
    elsif book_exists && book_belongs_to_current_user
      find_user_by_current_user_id
      erb :"/books/edit"
    else
      flash[:message] = "Click the 'View Reading List' link at the top of the page to select a book to edit."
      redirect "/users/#{current_user.id}"
    end
  end

  patch '/books/:id' do
    find_book_by_id
    if valid_book_form_submission
      save_changes_to_book
      redirect "/books/#{@book.id}"
    else
      fill_out_all_fields
      redirect "/books/#{@book.id}/edit"
    end
  end

  delete '/books/:id' do
    find_book_by_id

    if !logged_in?
      redirect "/login"
    elsif book_belongs_to_current_user
      @book.destroy
      redirect "/books"
    else
      redirect "/users/#{current_user.id}"
    end
  end
end
