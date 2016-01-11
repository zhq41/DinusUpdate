require 'net/http'
require 'rubygems'
require 'nokogiri'   
require 'open-uri'
require 'uri'

#nim = "A11.2011.06004"
#url = "beasiswaunggulan.dinus.ac.id/page/detail_mhs/#{nim}/ANDREAS-WIDIANTO.html"


(24383940..24384000).each do |s|
  puts "load for id #{s}"
  url1 = "http://stackoverflow.com/questions/#{s}"
  uri = URI.parse(url1)
  http = Net::HTTP::Get.new(uri.host, uri.port)
  request = Net::HTTP::Get.new(uri.request_uri)
  response = http.request(request)
  if response.code != "404"
   page = Nokogiri::HTML(open(url1))
   news_links = page.css("h1")
   news_links.each do |link| 
     puts "[#{s}] =  #{link.text}"
   end
  end
end
