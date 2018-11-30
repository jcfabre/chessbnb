puts "Destroying all records..."
Booking.destroy_all
Game.destroy_all
User.destroy_all
TimeControl.destroy_all

require 'faker'

addresses = ["11 rue Lamartine Paris", "146 avenue parmentier Paris", "3 rue de rivoli Paris", "Place d'armes Versailles", "61 Route des Tribunes 75016 Paris"]

# Create time controls

time_control1 = TimeControl.create(name: "Blitz", duration: 5)
time_control2 = TimeControl.create(name: "Rapid", duration: 20)
time_control3 = TimeControl.create(name: "Classic", duration: 100)
array_time_control = [time_control1, time_control2, time_control3]

# Create users

user1 = User.create!(email: "paul@cheam.io",
                rating: 2300,
                first_name: "Paul",
                last_name: "Cheam",
                remote_photo_url: "https://res.cloudinary.com/doojphhb7/image/upload/v1543570145/paul.png",
                password: 'password',
                password_confirmation: 'password'
                )

user_attributes = [
  {remote_photo_url: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569551/images_12.jpg"},
  {remote_photo_url: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569551/images_7.jpg"},
  {remote_photo_url: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569551/images_8.jpg"},
  {remote_photo_url: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569551/images_10.jpg"},
  {remote_photo_url: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569551/images_9.jpg"},
  {remote_photo_url: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569551/images_6.jpg"},
  {remote_photo_url: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569551/images_5.jpg"},
  {remote_photo_url: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569551/images_11.jpg"},
  {remote_photo_url: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569552/images_4.jpg"},
  {remote_photo_url: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569554/images_3.jpg"},
  {remote_photo_url: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569554/download_13.jpg"},
  {remote_photo_url: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569555/download_12.jpg"},
  {remote_photo_url: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569555/download_11.jpg"},
  {remote_photo_url: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569555/download_10.jpg"},
  {remote_photo_url: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569556/images_2.jpg"},
  {remote_photo_url: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569556/images_1.jpg"},
  {remote_photo_url: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569557/images.jpg"},
  {remote_photo_url: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569557/download_9.jpg"},
  {remote_photo_url: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569558/download_8.jpg"},
  {remote_photo_url: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569558/download_7.jpg"},
  {remote_photo_url: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569558/download_6.jpg"},
  {remote_photo_url: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569559/download_5.jpg"},
  {remote_photo_url: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569560/download_4.jpg"},
  {remote_photo_url: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569561/download_3.jpg"},
]

user_attributes.each do |attribute|
  User.create!(
    first_name: Faker::Internet.username(5..8),
    last_name: Faker::Ancient.god,
    rating: rand(1001..2835),
    remote_photo_url: attribute[:remote_photo_url],
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password'
  )
  2.times do
    game = Game.new(
      title: Faker::GreekPhilosophers.quote,
      address: addresses.shuffle[1],
      description: Faker::Lorem.paragraph(2, true),
      remote_photo_url: "https://cdn.cnn.com/cnnnext/dam/assets/181128205455-magnus-carlsen-super-tease.jpg",
      start_date: Time.now.to_datetime,
      end_date: Time.now.to_datetime.end_of_day
    )
    game.user = User.last
    game.time_control = array_time_control.shuffle[0]
    game.save!
  end
end

