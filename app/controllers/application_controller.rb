require './config/environment'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
    register Sinatra::Flash
  end

  get '/' do
    if !logged_in?
      erb :index
    else
      redirect "/users/#{current_user.id}"
    end
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:id])
    end

    def find_user_by_current_user_id
      @user = User.find_by(id: current_user.id)
    end

    def find_book_by_id
      @book = Book.find_by(id: params[:id])
    end

    def book_exists
      @book != nil
    end

    def book_belongs_to_current_user
      @book.user_id == current_user.id
    end

    def valid_book_form_submission
      params[:title] != "" && params[:author] != ""
    end

    def set_and_save_title_and_author
      @book = Book.new(params)
      @book.user_id = current_user.id
      @book.save
    end

    def save_changes_to_book
      @book.title = params[:title]
      @book.author = params[:author]
      @book.save
    end

    def log_in_to_view_page
      flash[:message] = "You need to log in to view this page."
    end

    def fill_out_all_fields
      flash[:message] = "Please make sure all fields are filled out before submitting form."
    end

    def valid_sign_up_form_submission
      params[:name] != "" && params[:email] != "" && params[:password] != ""
    end

    def unique_name
      !User.find_by(name: params[:name])
    end

  end

end
