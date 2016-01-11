require "csv"

jurusan = "A11"
angkatan = 2005
count = 0
(angkatan..2015).each do |a|
 total = 0
 pertama = 0
 CSV.foreach("data#{jurusan}_#{a}.csv") do |row|
   total = total+1
   if pertama == 0
     puts row[0]
     pertama = 1
   end
 end
 puts "angkatan #{a} = #{total} mahasiswa"
 count = count + total
end

puts "total = #{count}"
