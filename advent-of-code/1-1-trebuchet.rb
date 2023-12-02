# 1-1: Trebuchet?!
sum = 0
File.foreach '1-1-1-1a-input' do |line|
  first = line.chomp.match(/\d/)[0]
  last = line.chomp.scan(/\d/).last
  sum += (first + last).to_i
end
puts sum