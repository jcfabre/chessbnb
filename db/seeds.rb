user1 = User.new(email: "jcharlesfabre@gmail.com", first_name: "jc", last_name: "fabre")
user1.password = 'valid_password'
user1.password_confirmation = 'valid_password'
user1.save!

user2 = User.new(email: "toto@gmail.com", first_name: "toto", last_name: "alfred")
user2.password = 'valid_password'
user2.password_confirmation = 'valid_password'
user2.save!

time_control1 = TimeControl.create(name: "Blitz", duration: 5)

game1 = Game.new(title: "Game in Paris", description: "Any kind of player")
game1.user = user1
game1.time_control = time_control1
game1.save!


booking1 = Booking.new
booking1.user = user2
booking1.game = game1
booking1.save
