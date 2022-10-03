# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts 'Destroying DB records...'
Portfolio.destroy_all
User.destroy_all
Stock.destroy_all

puts 'Creating users...'
leith = User.create!(username: 'Leith', email: 'leith.atia@gmail.com', password: 'password')
jim = User.create!(username: 'Jim', email: 'jim@gmail.com', password: 'password')

puts 'Creating stocks...'
leith.stocks.create!(ticker: 'AAPL')
leith.stocks.create!(ticker: 'MSFT')
leith.stocks.create!(ticker: 'TSLA')
leith.stocks.create!(ticker: 'HPE')
leith.stocks.create!(ticker: 'SONY')

jim.stocks.create!(ticker: 'HYMFT')
jim.stocks.create!(ticker: 'MSFT')
jim.stocks.create!(ticker: 'RACE')
jim.stocks.create!(ticker: 'HPE')

puts 'Done!'
