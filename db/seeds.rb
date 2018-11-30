puts "Destroying Bookings..."
Booking.destroy_all
puts "Destroying Games..."
Game.destroy_all
puts "Destroying Users..."
User.destroy_all
puts "Destroying Time Controls..."
TimeControl.destroy_all
puts "Seeding database..."

require 'faker'

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
  game_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543572479/images_26.jpg",
  address: "11 rue Lamartine Paris"},

  {profile_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569551/images_7.jpg",
  game_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543572479/images_23.jpg",
  address: "146 avenue parmentier Paris"},

  {profile_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569551/images_8.jpg",
  game_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543572479/download_16.jpg",
  address: "3 rue de rivoli Paris"},

  {profile_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569551/images_10.jpg",
  game_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543572479/images_24.jpg",
  address: "Place d'armes Versailles"},

  {profile_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569551/images_9.jpg",
  game_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543572479/images_22.jpg",
  address: "61 Route des Tribunes 75016 Paris"},

  {profile_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569551/images_6.jpg",
  game_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543572479/images_27.jpg",
  address: "11 Avenue de Thônes, 74000 Annecy"},

  {profile_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569551/images_5.jpg",
  game_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543572480/images_21.jpg",
  address: "50 Avenue du Parmelan, 74000 Annecy"},

  {profile_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569551/images_11.jpg",
  game_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543572479/images_25.jpg",
  address: "7 Rue de la Paix, 74000 Annecy"},

  {profile_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569552/images_4.jpg",
  game_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543572480/download_17.jpg",
  address: "18 Boulevard de la Rocade, 74000 Annecy"},

  {profile_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569554/images_3.jpg",
  game_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543572482/images_20.jpg",
  address: "29 bis, Rue Vaugelas, 74000 Annecy"},

  {profile_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569554/download_13.jpg",
  game_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543572482/images_19.jpg",
  address: "19 Rue Sommeiller, 74000 Annecy"},

  {profile_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569555/download_12.jpg",
  game_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543572482/images_18.jpg",
  address: "19 Rue Sommeiller, 74000 Annecy"},

  {profile_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569555/download_11.jpg",
  game_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543572483/images_17.jpg",
  address: "19 Rue Sommeiller, 74000 Annecy"},

  {profile_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569555/download_10.jpg",
  game_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543572483/images_16.jpg",
  address: "19 Rue Sommeiller, 74000 Annecy"},

  {profile_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569556/images_1.jpg",
  game_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543572484/images_14.jpg",
  address: "9 Rue de la République, 74000 Annecy"},

  {profile_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569557/images.jpg",
  game_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543572485/images_13.jpg",
  address: "34 avenue de chambery 74000 Annecy"},

  {profile_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569557/download_9.jpg",
  game_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543572485/download_14.jpg",
  address: "29 Rue des Marquisats, 74000 Annecy"},

  {profile_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569558/download_8.jpg",
  game_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543572484/images_15.jpg",
  address: "1 Allée de l'Impérial, 74000 Annecy"},

  {profile_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569558/download_7.jpg",
  game_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543572756/images_31.jpg",
  address: "29 Rue des Marquisats, 74000 Annecy"},

  {profile_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569558/download_6.jpg",
  game_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543572757/images_30.jpg",
  address: "7 Avenue de Brogny, 74000 Annecy"},

  {profile_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569559/download_5.jpg",
  game_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543572757/images_29.jpg",
  address: "58 Rue des Marquisats, 74000 Annecy"},

  {profile_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569560/download_4.jpg",
  game_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543572758/images_28.jpg",
  address: "92 Rue des Marquisats, 74000 Annecy"},

  {profile_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569561/download_3.jpg",
  game_photo: "https://res.cloudinary.com/doojphhb7/image/upload/v1543572483/download_15.jpg",
  address: "8 Route du Semnoz, 74000 Annecy"}
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
    address: attribute[:address],
    description: Faker::Lorem.paragraph(2, true),
    remote_photo_url: attribute[:game_photo],
    start_date: Time.now.to_datetime,
    end_date: Time.now.to_datetime.end_of_day
  )
  game.user = User.last
  game.time_control = array_time_control.shuffle[0]
  game.save!
end

user2 = User.create!(email: "paula@cheam.io",
                rating: 2300,
                first_name: "Mammie",
                last_name: "Grannie",
                remote_photo_url: "https://res.cloudinary.com/doojphhb7/image/upload/v1543569556/images_2.jpg",
                password: 'password',
                password_confirmation: 'password'
                )

 game = Game.new(
    title: "Chess and cookies afternoon in Annecy",
    address: "2 Chemin de la Colline, 74940 Annecy",
    description: "Come to my house play chess. I'll make some cookies :)",
    remote_photo_url: "https://res.cloudinary.com/doojphhb7/image/upload/v1543572756/download_18.jpg",
    start_date: Time.now.to_datetime,
    end_date: Time.now.to_datetime.end_of_day
  )
  game.user = user2
  game.time_control = array_time_control.shuffle[0]
  game.save!

