require 'uri'
require 'net/http'

url = URI("https://yahoo-finance127.p.rapidapi.com/search/aa")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Get.new(url)
request["X-RapidAPI-Key"] = 'ENV_VAR'
request["X-RapidAPI-Host"] = 'yahoo-finance127.p.rapidapi.com'

response = http.request(request)
puts response.read_body
