# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

IMAGES_DIR = File.expand_path(File.dirname(__FILE__) + "/../app/assets/images/")

Message.destroy_all

def create_messages(user)
  puts "Creating Messages #{user.full_name}"
  20.times {
    putc "."
    user.messages.create! ({
      body: Faker::HowIMetYourMother.quote,
      created_at: Faker::Date.between(2.weeks.ago, Time.now),
      })
      user.save
  }
  puts "done with messages"
end

puts "It's generating my users"
u = User.find_or_create_by(username: "eewhyoh")
u.update_attributes({
  first_name:   "EY",
  last_name:    "Oh",
  city:         "Columbus",
  state:        "OH",
  bio:          "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  fake:         false,
  email:        "eewhyoh@gmail.com",
  password: "asdfghjkl",
  password_confirmation: "asdfghjkl"
})

u.save!
create_messages(u)

puts "Deleting fake users\n"

User.where(fake: true).destroy_all

puts "Generating fake users"
10.times do |time|
  putc "."
  u = User.new ({
    username:     Faker::Internet.username,
    first_name:   Faker::Name.first_name,
    last_name:    Faker::Name.last_name,
    city:         Faker::Address.city,
    state:        Faker::Address.state_abbr,
    bio:          Faker::Lorem.paragraph,
    fake:         true,
    email:        Faker::Internet.email,
    password:     "asdfghjkl",
    password_confirmation: "asdfghjkl"
    })
    filename = "sample#{time + 1}.jpg"
    u.avatar.attach(io: File.open(IMAGES_DIR + "/" + filename), filename: filename)
    u.save!
    sleep 3
    create_messages(u)
end

puts "done"
