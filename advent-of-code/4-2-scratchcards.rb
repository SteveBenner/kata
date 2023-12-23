# 4-2: Scratchcards
MATRIX = IO.readlines '/Users/sven/github/kata/advent-of-code/4-1-input'
NUM = /(\d{1,2})/
$cards = 0
p = MATRIX.reduce(0) do |sum, card|
  card_num = card.match(/Card (\d{1,3})/)[0]
  winning_numbers = card.match(/Card *\d{1,3}:(.*)\|/)[0].scan(NUM).flatten
  winning_numbers.shift until winning_numbers.count === 10
  numbers = card.match(/\|  ?(\d+(?:  ?\d+)*)/)[0].scan(NUM).flatten
  wn = numbers.select {| n| winning_numbers.include? n }.count
  card_copies = (card_num+1..card_num+wn).to_a
  card_copies.each { |c| sum += 1 }
  
  sum
end
puts p