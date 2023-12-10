# 3-2: Gear Ratios
MATRIX = IO.readlines '/Users/sven/github/kata/advent-of-code/3-input'
$sum = 0
ROWS = MATRIX.length
COLS = MATRIX[0].length

def valid_position?(row, col)
  row >= 0 && row < ROWS && col >= 0 && col < COLS
end

(0...ROWS).each do |row|
  num, nums, $gears = [], [], []
  (0...COLS).each do |col|
    next unless MATRIX[row][col] =~ /\*/
    adjacent_positions = [
      [row - 1, col - 1], [row - 1, col], [row - 1, col + 1],
      [row, col - 1],                     [row, col + 1],
      [row + 1, col - 1], [row + 1, col], [row + 1, col + 1]
    ]
    adjacent_positions.each do |r, c|
      print [r, c]
      if valid_position?(r, c) && MATRIX[r][c] =~ /\d/
        # find rest of number: go left, then right
        origin = c
        num << MATRIX[r][c]
        until !valid_position?(r, c) || MATRIX[r][c] =~ /\./ do
          c -= 1
          num.unshift MATRIX[r][c] unless MATRIX[r][c] =~ /\./
        end
        c = origin
        until !valid_position?(r, c) || MATRIX[r][c] =~ /\./ do
          c += 1
          num << MATRIX[r][c]
        end
        nums << num.join.to_i
        print nums
        next
      end
    end

  end
end