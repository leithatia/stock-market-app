require 'csv'

# csv_text = File.read(Rails.root.join('lib', 'seeds', 'nasdaq_screener_1664808689118.csv'))
# puts csv_text

puts 'Destroying DB records...'
Portfolio.destroy_all
User.destroy_all
Stock.destroy_all

puts 'Creating users...'
leith = User.create!(username: 'Leith', email: 'leith.atia@gmail.com', password: 'password')
jim = User.create!(username: 'Jim', email: 'jim@gmail.com', password: 'password')

puts 'Creating stocks...'
CSV.foreach('lib/seeds/nasdaq_screener_1664808689118.csv', headers: true) do |row|
  Stock.create!(symbol: row[0].to_s, name: row[1].to_s)
end

# puts 'Building portfolios...'
# leith.stocks << aapl
# leith.stocks << msft
# leith.stocks << hpe
# leith.stocks << sony
# leith.stocks << race

# jim.stocks << tsla
# jim.stocks << msft
# jim.stocks << aapl
# jim.stocks << hpe

# puts 'Done!'
