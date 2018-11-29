puts "Destroying all records..."
Booking.destroy_all
Game.destroy_all
User.destroy_all


require 'faker'

addresses = ["11 rue Lamartine Paris", "146 avenue parmentier Paris", "3 rue de rivoli Paris", "Place d'armes Versailles", "61 Route des Tribunes 75016 Paris"]

time_control1 = TimeControl.create(name: "Blitz", duration: 5)
time_control2 = TimeControl.create(name: "Rapid", duration: 20)
time_control3 = TimeControl.create(name: "Classic", duration: 100)
array_time_control = [time_control1, time_control2, time_control3]

user1 = User.new(email: "jcharlesfabre@gmail.com",
                rating: 1700,
                first_name: "jc",
                last_name: "fabre",
                remote_photo_url: "https://chessbase.in/images/20161003_pic_0953_jpg")
user1.password = 'valid_password'
user1.password_confirmation = 'valid_password'
user1.save!

user2 = User.new(email: "toto@gmail.com",
  first_name: "toto",
  last_name: "Alfred",
  rating: 1550,
  remote_photo_url: "https://fr.wikipedia.org/wiki/Yu_Yangyi#/media/File:Yu_Yangyi_2012.jpg"
)
user2.password = 'valid_password'
user2.password_confirmation = 'valid_password'
user2.save!


user3 = User.new(
  email: "connor.bubbles@yahoo.com",
  first_name: "connor",
  last_name: "bubbles",
  rating: 2300,
  remote_photo_url:"https://cdn2.listsoplenty.com/listsoplenty-cdn/uploads/2011/06/kateryna_lahno.jpg"
)
user3.password = 'ikv.q7KT_hS)'
user3.password_confirmation = 'ikv.q7KT_hS)'
user3.save!

10.times do
  first_name = Faker::Superhero.prefix
  last_name = Faker::Ancient.god

  User.create!(
    first_name: first_name,
    last_name: last_name,
    rating: rand(1001..2835),
    remote_photo_url: "https://new.uschess.org/wp-content/uploads/2017/06/fabir3.jpg",
    email: Faker::Internet.email("#{first_name} #{last_name}" , '.'),
    password: 'valid_password'
  )

  2.times do
    game = Game.new(
      title: Faker::GreekPhilosophers.quote,
      address: addresses.shuffle[1],
      description: Faker::Lorem.paragraph(2, true),
      remote_photo_url: "https://en.wikipedia.org/wiki/Almira_Skripchenko#/media/File:ASkripchenko10.jpg",
      start_date: Time.now.to_datetime,
      end_date: Time.now.to_datetime.end_of_day
    )
    game.user = User.last
    game.time_control = array_time_control.shuffle[0]
    game.save!
  end
end

