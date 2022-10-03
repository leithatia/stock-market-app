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
aapl = Stock.create!(ticker: 'AAPL')
msft = Stock.create!(ticker: 'MSFT')
tsla = Stock.create!(ticker: 'TSLA')
hpe = Stock.create!(ticker: 'HPE')
sony = Stock.create!(ticker: 'SONY')
race = Stock.create!(ticker: 'RACE')

puts 'Building portfolios...'
leith.stocks << aapl
leith.stocks << msft
leith.stocks << hpe
leith.stocks << sony
leith.stocks << race

jim.stocks << tsla
jim.stocks << msft
jim.stocks << aapl
jim.stocks << hpe


puts 'Done!'
