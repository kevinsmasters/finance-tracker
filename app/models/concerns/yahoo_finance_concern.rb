module YahooFinanceConcern
  extend ActiveSupport::Concern

  class_methods do
    def stock_lookup(symbol)

      stonk = {}
      require 'uri'
      require 'net/http'
      require 'json'

      url = URI("https://yahoo-finance127.p.rapidapi.com/price/#{symbol}")

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true

      request = Net::HTTP::Get.new(url)
      request["X-RapidAPI-Key"] = ENV["RAPID_API_KEY"]
      request["X-RapidAPI-Host"] = 'yahoo-finance127.p.rapidapi.com'

      response = http.request(request)

      output = JSON.parse(response.read_body)

      puts output
      # puts output['shortName']
      # puts output['regularMarketPrice']['raw']

      stonk[:name] = output['shortName']

      stonk[:price] = output['regularMarketPrice']['raw']

      return stonk

    end
  end
end
