require 'faker'


time_control1 = TimeControl.create(name: "Blitz", duration: 5)
time_control2 = TimeControl.create(name: "Rapid", duration: 20)
time_control3 = TimeControl.create(name: "Classic", duration: 100)
array_time_control = [time_control1, time_control2, time_control3]

user1 = User.new(email: "jcharlesfabre@gmail.com", first_name: "jc", last_name: "fabre")
user1.password = 'valid_password'
user1.password_confirmation = 'valid_password'
user1.save!

user2 = User.new(email: "toto@gmail.com", first_name: "toto", last_name: "Alfred")
user2.password = 'valid_password'
user2.password_confirmation = 'valid_password'
user2.save!

user3 = User.new(email: "connor.bubbles@yahoo.com", first_name: "connor", last_name: "bubbles")
user3.password = 'ikv.q7KT_hS)'
user3.password_confirmation = 'ikv.q7KT_hS)'
user3.save!

10.times do
  first_name = Faker::Superhero.prefix
  last_name = Faker::Ancient.god

  User.create!(
    first_name: first_name,
    last_name: last_name,
    email: Faker::Internet.email("#{first_name} #{last_name}" , '.'),
    password: 'valid_password'
  )

  2.times do
    game = Game.new(
      title: Faker::GreekPhilosophers.quote,
      address: Faker::Address.full_address,
      description: Faker::Lorem.paragraph(2, true),
      remote_photo_url: "http://paris1900.lartnouveau.com/paris14/parc_montsouris/accueil/1p_monts5.jpg",
      start_date: Time.now.to_datetime,
      end_date: Time.now.to_datetime.end_of_day
    )
    game.user = User.last
    game.time_control = array_time_control.shuffle[0]
    game.save!
  end

end

booking1 = Booking.new
booking1.user = User.first
booking1.game = Game.last(3).first
booking1.save!

booking2 = Booking.new
booking2.user = User.second
booking2.game = Game.last(2).first
booking2.save!

booking3 = Booking.new
booking3.user = User.third
booking3.game = Game.last
booking3.save!
