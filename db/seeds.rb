# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# db/seeds.rb

# Create some expense categories
expense_categories = ExpenseCategory.create([
  { name: 'Food' },
  { name: 'Transportation' },
  { name: 'Entertainment' }
])

puts 'Expense categories created.'

# Create a sample user with password_digest
user = User.create(
  name: 'John Doe',
  email: 'john@example.com',
  password_digest: BCrypt::Password.create('password') # Hash the password
)

puts 'User created.'

# Create some sample expenses associated with the user and expense categories
expenses = Expense.create([
  {
    user: user,
    expense_category: expense_categories[0],
    amount: 25.50,
    date: Date.today - 7,
    description: 'Dinner at a restaurant'
  },
  {
    user: user,
    expense_category: expense_categories[1],
    amount: 10.00,
    date: Date.today - 5,
    description: 'Bus fare'
  },
  {
    user: user,
    expense_category: expense_categories[2],
    amount: 15.00,
    date: Date.today - 3,
    description: 'Movie ticket'
  }
])

puts 'Expenses created.'

# You can add more seed data as needed.

puts 'Seed data populated successfully.'