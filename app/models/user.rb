class User < ActiveRecord::Base
  has_many :books
  has_secure_password

  def number_of_books
    self.books.size
  end

  def book_list_stats
    if number_of_books == 0
      "You do not have any books on your list."
    elsif number_of_books == 1
      "You have 1 book on your list."
    elsif number_of_books > 1
      "You have #{self.number_of_books} books on your list."
    end
  end
end
