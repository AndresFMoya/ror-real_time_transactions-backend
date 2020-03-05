# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(username: 'admin', email: 'admin@example.com', password_digest: 'password')
user1 = User.create(username: 'user', email: 'user@example.com', password_digest: 'password')

group1 = Group.create(creator_id: 1, name: 'Family Expenses', description: 'Expenses and Savings at Home')

membership1 = Membership.create(group_id: 1, member_id: 1)

transaction1 = Transaction.create(author_id: 1, description: 'Food', amount: 475)