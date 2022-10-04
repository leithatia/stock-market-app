class StocksController < ApplicationController
  before_action :authenticate_user!
  
  def index
    # @user = nil
    find_top_stocks
  end

  def show
    @stock = Stock.find(params[:id])
  end

  def my_stocks
    @my_stocks = current_user.stocks
  end

  private

  def find_top_stocks
    # Get 100 rows from html table containing stock info of biggest global companies
    @top_stocks = []
    rows = parse_html("https://www.tradingview.com/markets/stocks-usa/market-movers-large-cap/")

    # Grab stock symbol from each row leaving out table header
    rows.drop(1).each do |row|
      stock_symbol = row.search(".tickerName-hMpTPJiS")
      @top_stocks << Stock.find_by(symbol: stock_symbol.text.strip)
    end
    @top_stocks
  end

  def parse_html(url)
    require "nokogiri"
    require "open-uri"

    # url = "https://www.tradingview.com/markets/stocks-usa/market-movers-large-cap/"

    html_file = URI.parse(url).open.read
    html_doc = Nokogiri::HTML(html_file)

    # Find table containing stock data through CSS class and return rows
    table = html_doc.at(".table-DR3mi0GH")
    table.search("tr")
  end

  # def write_stocks(company_symbol, company_name, company_logo, stock_price, change_1d_percentage, change_1d_currency)
  #   @top_stocks.push({
  #                  symbol: company_symbol.text.strip,
  #                  name: company_name.text.strip,
  #                  logo_URL: company_logo,
  #                  price: stock_price.text.strip.match(/\d*.\d*(?=USD)/),
  #                  change_percent: change_1d_percentage.text.strip,
  #                  change_currency: change_1d_currency.text.strip
  #                })
  # end
end
