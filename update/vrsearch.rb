# coding: utf-8
require "rubygems"
require "net/http"
require "uri"
require "json"
require "pp"
require "cgi"

API_KEY = "AIzaSyDWj0oLZ9E3FCz52wuP9ORo1JDTe2T96gw"
CSE_KEY = "017109665700922583163:vg4jfedf4li"
Number = 10
QUERIES = ["アダルト", "エロアニメ", "ポルノ", "巨乳", "アダルトビデオ", "セックス", "エロゲ", "美女", "美少女", "オナニー"]
day = Time.now
#filename = "URL" + day.year.to_s + day.month.to_s + day.day.to_s + ".txt"
filename = "urls"
file = File.open(filename, "w")
uArray = []

QUERIES.each do |q|
  query = CGI.escape("\"VR\" " + "\"" + q + "\"");
  p query

  for i in 0..5
    start = i * 10 + 1
    p start
    puts "start:" + start.to_s
    api_url = URI.parse("https://www.googleapis.com/customsearch/v1?key=#{API_KEY}&cx=#{CSE_KEY}&q=#{query}&num=#{Number}&start=#{start}")
    https = Net::HTTP.new(api_url.host, api_url.port)
    https.use_ssl = true
    res = https.start{
      https.get(api_url.request_uri)
    }
    
    if res.code == "200"
      puts "code:200"
      result = JSON.parse(res.body)
      if result != nil and result["items"] != nil 
        result["items"].each do |tag|
          tag.each do |fac|
            if fac[0] == "link"
              uArray.push(fac[1])
            end
          end
        end
      else
        puts "NIL"
      end
    else
      puts "#{res.code} #{res.message}"
    end
  end
end
neuArray = uArray.uniq

neuArray.each do |url|
  file.puts(url)
end
