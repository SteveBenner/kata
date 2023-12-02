# 1-2: Trebuchet?!
NUMBERS = /1|2|3|4|5|6|7|8|9|one|two|three|four|five|six|seven|eight|nine/
NUMBER_HASH = {one: 1, two: 2, three: 3, four: 4, five: 5, six: 6, seven: 7, eight: 8, nine: 9}
NUMBERS_REV = /1|2|3|4|5|6|7|8|9|eno|owt|eerht|ruof|evif|xis|neves|thgie|enin/
NUMBER_HASH_REV = {eno: 1, owt: 2, eerht: 3, ruof: 4, evif: 5, xis: 6, neves: 7, thgie: 8, enin: 9}

def first_digit(line)
  digit = line.chomp.match(NUMBERS)[0]
  digit.length == 1 ? digit : NUMBER_HASH[digit.to_sym]
end

def last_digit(line)
  digit = line.chomp.match(NUMBERS_REV)[0]
  digit.length == 1 ? digit : NUMBER_HASH_REV[digit.to_sym]
end

sum = 0
$line = 0
File.foreach '1-1-input' do |line|
  $line += 1
  first = first_digit line
  last = last_digit line.reverse
  sum += (first.to_s + last.to_s).to_i
  puts "#{$line}: #{first}#{last}"
end
puts sum