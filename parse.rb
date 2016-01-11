require "rubygems"
require "net/http"
require "uri"
require "open-uri"

fakultas = "A"
jurusan  = "A11"
angkatan = "2005"

File.open("data#{jurusan}_#{angkatan}.csv", "w+") do |f|
 (2000..2682).each do |nim|
   uri = URI.parse("http://mahasiswa.dinus.ac.id/images/foto/#{fakultas}/#{jurusan}/#{angkatan}/#{jurusan}.#{angkatan}.0#{nim}.jpg")
   http = Net::HTTP.new(uri.host, uri.port)
   request = Net::HTTP::Get.new(uri.request_uri)
   response = http.request(request)
   if response.code == "200"
      puts "nim 0#{nim} ada"
      f << "#{jurusan}.#{angkatan}.0#{nim}"
      f << "\n"
   else
      puts "nim 0#{nim} tidak ada"
   end
 end
end
