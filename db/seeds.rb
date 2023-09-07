# db/seeds.rb

# Seed data for users table
User.create(name: 'John Doe', email: 'johndoe@example.com', password_digest: BCrypt::Password.create('password123'))
User.create(name: 'Jane Smith', email: 'janesmith@example.com', password_digest: BCrypt::Password.create('password456'))
# Add more users as needed

# You can also use Faker gem to generate random data for testing purposes
# Uncomment the following lines if you have the Faker gem installed
# 10.times do
#   User.create(
#     name: Faker::Name.name,
#     email: Faker::Internet.email,
#     password_digest: BCrypt::Password.create(Faker::Internet.password)
#   )
# end
