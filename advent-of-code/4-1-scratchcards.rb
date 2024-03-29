# 4-1: Scratchcards
MATRIX = IO.readlines '/Users/sven/github/kata/advent-of-code/4-1-input'
NUM = /(\d{1,2})/
p = MATRIX.reduce(0) do |sum, card|
  winning_numbers = card.match(/Card *\d{1,3}:(.*)\|/)[0].scan(NUM).flatten
  winning_numbers.shift until winning_numbers.count === 10
  numbers = card.match(/\|  ?(\d+(?:  ?\d+)*)/)[0].scan(NUM).flatten
  wn = numbers.reduce([]) do |nums, n|
    nums << n if winning_numbers.include? n
    nums
  end
  if wn.count === 0
    sum
  else
    sum + 2**(wn.count-1)
  end
end
puts p
