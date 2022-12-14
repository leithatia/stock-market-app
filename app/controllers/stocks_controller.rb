class StocksController < ApplicationController
  before_action :authenticate_user!

  def index
    # @user = nil
    find_top_stocks
  end

  def show
    stock = Stock.find(params[:id])
    find_stock(stock)
  end

  def my_stocks
    @my_stocks = current_user.stocks
  end

  private

  def find_stock(stock)
    html_doc = parse_html("https://seekingalpha.com/symbol/#{stock[:symbol]}")
    node = html_doc.search(".cardsLayout")

    price_and_change = node.text.scan(/\$\d*.\d*.\d*.\d\d/).first.split('.', 2)
    price_cents = price_and_change[1][0, 2]
    stock_price = "#{price_and_change[0]}.#{price_cents}"
    stock_chg_1d_currency = price_and_change[1][2..]
    stock_chg_1d_percent = node.text.scan(/\(.\d.\d\d/).first[1..]

    @stock = {
      name: stock[:name],
      symbol: stock[:symbol],
      price: stock_price,
      chg_1d_currency: stock_chg_1d_currency,
      chg_1d_percent: stock_chg_1d_percent,
      history: stock_history(stock)
    }
    # raise
  end

  def find_top_stocks
    # Get 100 rows from html table containing stock info of biggest global companies
    @top_stocks = []
    html_doc = parse_html("https://www.tradingview.com/markets/stocks-usa/market-movers-large-cap/")
    # Find table containing stock data through CSS class and return rows
    table = html_doc.at(".table-DR3mi0GH")
    rows = table.search("tr")

    # Grab stock symbol from each row leaving out table header
    rows.drop(1).each do |row|
      stock_symbol = row.search(".tickerName-hMpTPJiS")
      @top_stocks << Stock.find_by(symbol: stock_symbol.text.strip)
    end
  end

  def stock_history(stock)
    url = "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=#{stock[:symbol]}&outputsize=full&apikey=DAU6SET7OA7BPMCC"
    data_serialized = URI.open(url).read
    JSON.parse(data_serialized)["Time Series (Daily)"]
  end

  def parse_html(url)
    require "nokogiri"
    require "open-uri"

    html_file = URI.parse(url).open.read
    Nokogiri::HTML(html_file)
  end
end
