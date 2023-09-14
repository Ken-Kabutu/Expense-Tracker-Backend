# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# db/seeds.rb

# Create some expense categories


# Add more expenses as needed
# db/seeds.rb

# Create some example incomes
Income.create(
  title: "Salary",
  description: "Monthly salary",
  amount: 5000.0,
  date: Date.today,
  income_type: "Regular",
  category: "Salary",
)

Income.create(
  title: "Freelance Payment",
  description: "Payment for freelance work",
  amount: 1000.0,
  date: Date.today - 7.days,
  income_type: "Irregular",
  category: "Freelance",
)

# Add more income records as needed...
