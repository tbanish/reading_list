# Users
tommy = User.create(name: "Tommy", email: "tom@tom.com", password: "password")
karlos = User.create(name: "Karlos", email: "karlos@karlos.com", password: "password")
nicole = User.create(name: "Nicole", email: "nicole@nicole.com", password: "password")
francis = User.create(name: "Francis", email: "francis@francis.com", password: "password")
gabriel = User.create(name: "Gabriel", email: "grabriel@grabriel.com", password: "password")

# Books
Book.create(title: "The Stand", author: "Stephen King", user_id: tommy.id)
Book.create(title: "American Pastoral", author: "Philip Roth", user_id: karlos.id)
Book.create(title: "The Road", author: "Cormac McCarthy", user_id: nicole.id)
Book.create(title: "The Twits", author: "Roald Dahl", user_id: francis.id)
Book.create(title: "Calvin and Hobbes", author: "Bill Watterson", user_id: gabriel.id)
