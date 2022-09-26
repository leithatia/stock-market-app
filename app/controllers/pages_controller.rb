# Home controller
class PagesController < ApplicationController
  def index
    require "nokogiri"
    require "open-uri"

    url = "https://www.tradingview.com/markets/stocks-usa/market-movers-large-cap/"

    html_file = URI.open(url).read
    html_doc = Nokogiri::HTML(html_file)
    table = html_doc.at(".table-DR3mi0GH")
    rows = table.search("tr")

    @stocks = []

    rows.drop(1).each do |row|
      company_name = row.search(".tickerDescription-hMpTPJiS")
      company_logo = row.search(".tv-circle-logo").attr('src')
      stock_price = row.search(".right-TKkxf89L")
      change_1d_percentage = row.search(".positive-C2C2Vilj")
      change_1d_currency = row.search(".positive-avn2kVRm")

      @stocks.push({
                     name: company_name.text.strip,
                     logo_URL: company_logo,
                     price: stock_price.text.strip.match(/\d*.\d*(?=USD)/),
                     change_percent: change_1d_percentage.text.strip,
                     change_currency: change_1d_currency.text.strip
                   })
    end
  end

  def about
  end
end
