require 'csv'

# csv_text = File.read(Rails.root.join('lib', 'seeds', 'nasdaq_screener_1664808689118.csv'))
# puts csv_text

puts 'Destroying DB records...'
User.destroy_all
Stock.destroy_all

puts 'Creating users...'
leith = User.create!(username: 'Leith', email: 'leith.atia@gmail.com', password: 'password')
jim = User.create!(username: 'Jim', email: 'jim@gmail.com', password: 'password')

# puts 'Creating stocks...'
# CSV.foreach('lib/seeds/nasdaq_screener_1664808689118.csv', headers: true) do |row|
#   stock_symbol = row[0].to_s.gsub(/[\/\^]/, '.')
#   stock_name = row[1].to_s
#   Stock.create!(symbol: stock_symbol, name: stock_name)
# end

puts 'Building portfolios...'
# leith.stocks << Stock.find_by(symbol: 'AAPL')
# leith.stocks << Stock.find_by(symbol: 'MSFT')
# leith.stocks << Stock.find_by(symbol: 'HPE')
# leith.stocks << Stock.find_by(symbol: 'SONY')
# leith.stocks << Stock.find_by(symbol: 'RACE')

# jim.stocks << Stock.find_by(symbol: 'TSLA')
# jim.stocks << Stock.find_by(symbol: 'MSFT')
# jim.stocks << Stock.find_by(symbol: 'AAPL')
# jim.stocks << Stock.find_by(symbol: 'HPE')

puts 'Done!'
