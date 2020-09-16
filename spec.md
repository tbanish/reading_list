
Specs:

 [x] Use Sinatra to build the app
 I am using Sinatra to build the app.

 [x] Use ActiveRecord for storing information in a database
 I am using ActiveRecord for storing information in a database.

 [x] Include more than one model class (e.g. User, Post, Category)
 I am using a User and Book model.

 [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
 A User has many books.

 [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
 A Book belongs to a User.

 [x] Include user accounts with unique login attribute (username or email)
 Users login in with a unique username.

 [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
 A user is able to create new books, view the books on their reading list, view each books individual page, edit each book's author and title and delete each book from their reading list.

 [x] Ensure that users can't modify content created by other users
 A user is only able to modify their own book content when logged in; they are never able to access another user's reading list, book show page, or user show page; they are not able to edit or delete another user's books and they are only able to edit or delete their own books if logged in.

 [x] Include user input validations
 A user can only log in, sign up, edit a book, or create a book if all parameters are filled out, otherwise they are redirected to another page.

 [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
 [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm:
 [ ] You have a large number of small Git commits
 [ ] Your commit messages are meaningful
 [ ] You made the changes in a commit that relate to the commit message
 [ ] You don't include changes in a commit that aren't related to the commit message
