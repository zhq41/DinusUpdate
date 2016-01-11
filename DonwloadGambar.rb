require "rubygems"
require "net/http"
require "uri"
require "open-uri"
require "csv"
#files = CSV.read("dataA11_2011.csv")

CSV.foreach("dataA11_2010.csv") do |row|
 puts row[0]
 Net::HTTP.start("mahasiswa.dinus.ac.id") do |http|
  resp = http.get("/images/foto/A/A11/2010/#{row[0]}.jpg")
  open("#{row[0]}.jpg", "w") do |file|
   file.write(resp.body)
  end
 end
end
