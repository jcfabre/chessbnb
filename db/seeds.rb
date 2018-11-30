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
  {profile_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569551/images_12.jpg",
  game_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543572479/images_26.jpg"},

  {profile_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569551/images_7.jpg",
  game_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543572479/images_23.jpg"},

  {profile_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569551/images_8.jpg",
  game_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543572479/download_16.jpg"},

  {profile_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569551/images_10.jpg",
  game_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543572479/images_24.jpg"},

  {profile_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569551/images_9.jpg",
  game_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543572479/images_22.jpg"},

  {profile_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569551/images_6.jpg",
  game_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543572479/images_27.jpg"},

  {profile_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569551/images_5.jpg",
  game_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543572480/images_21.jpg"},

  {profile_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569551/images_11.jpg",
  game_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543572479/images_25.jpg"},

  {profile_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569552/images_4.jpg",
  game_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543572480/download_17.jpg"},

  {profile_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569554/images_3.jpg",
  game_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543572482/images_20.jpg"},

  {profile_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569554/download_13.jpg",
  game_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543572482/images_19.jpg"},

  {profile_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569555/download_12.jpg",
  game_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543572482/images_18.jpg"},

  {profile_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569555/download_11.jpg",
  game_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543572483/images_17.jpg"},

  {profile_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569555/download_10.jpg",
  game_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543572483/images_16.jpg"},

  {profile_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569556/images_2.jpg",
  game_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543572484/images_15.jpg"},

  {profile_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569556/images_1.jpg",
  game_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543572484/images_14.jpg"},

  {profile_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569557/images.jpg",
  game_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543572485/images_13.jpg"},

  {profile_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569557/download_9.jpg",
  game_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543572485/download_14.jpg"},

  {profile_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569558/download_8.jpg",
  game_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543572756/download_18.jpg"},

  {profile_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569558/download_7.jpg",
  game_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543572756/images_31.jpg"},

  {profile_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569558/download_6.jpg",
  game_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543572757/images_30.jpg"},

  {profile_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569559/download_5.jpg",
  game_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543572757/images_29.jpg"},

  {profile_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569560/download_4.jpg",
  game_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543572758/images_28.jpg"},

  {profile_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569561/download_3.jpg",
  game_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543572483/download_15.jpg"}
]

user_attributes.each do |attribute|
  User.create!(
    first_name: Faker::Internet.username(5..8),
    last_name: Faker::Ancient.god,
    rating: rand(1001..2835),
    remote_photo_url: attribute[:profile_photo],
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password'
  )
  game = Game.new(
    title: "Afternoon of chess at the club, free drinks",
    address: addresses.shuffle[1],
    description: Faker::Lorem.paragraph(2, true),
    remote_photo_url: attribute[:game_photo],
    start_date: Time.now.to_datetime,
    end_date: Time.now.to_datetime.end_of_day
  )
  game.user = User.last
  game.time_control = array_time_control.shuffle[0]
  game.save!
end

