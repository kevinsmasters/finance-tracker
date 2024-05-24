module YahooFinanceConcern
  extend ActiveSupport::Concern

  def stock_lookup(symbol)
    require 'uri'
    require 'net/http'

    url = URI("https://yahoo-finance127.p.rapidapi.com/search/#{symbol}")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["X-RapidAPI-Key"] = ENV["RAPID_API_KEY"]
    request["X-RapidAPI-Host"] = 'yahoo-finance127.p.rapidapi.com'

    response = http.request(request)
    puts response.read_body
  end
end
