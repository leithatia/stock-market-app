# Home controller
class PagesController < ApplicationController
  def index
    read_stocks
  end

  def about
  end

  private

  def read_stocks
    # Get all rows from html table containing stock info
    @stocks = []
    rows = parse_html

    # Grab stock data from each row leaving out table header
    rows.drop(1).each do |row|
      company_name = row.search(".tickerDescription-hMpTPJiS")
      company_logo = row.search(".tv-circle-logo").attr('src')
      stock_price = row.search(".right-TKkxf89L")
      change_1d_percentage = row.search(".positive-C2C2Vilj")
      change_1d_currency = row.search(".positive-avn2kVRm")
      write_stocks(company_name, company_logo, stock_price, change_1d_percentage, change_1d_currency)
    end
  end

  def parse_html
    require "nokogiri"
    require "open-uri"

    url = "https://www.tradingview.com/markets/stocks-usa/market-movers-large-cap/"

    html_file = URI.parse(url).open.read
    html_doc = Nokogiri::HTML(html_file)

    # Find table containing stock data through CSS class and return rows
    table = html_doc.at(".table-DR3mi0GH")
    table.search("tr")
  end

  def write_stocks(company_name, company_logo, stock_price, change_1d_percentage, change_1d_currency)
    @stocks.push({
                   name: company_name.text.strip,
                   logo_URL: company_logo,
                   price: stock_price.text.strip.match(/\d*.\d*(?=USD)/),
                   change_percent: change_1d_percentage.text.strip,
                   change_currency: change_1d_currency.text.strip
                 })
  end
end
