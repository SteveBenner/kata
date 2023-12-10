# 3-1: Gear Ratios
MATRIX = []
File.foreach('/Users/sven/github/kata/advent-of-code/3-input') {|line| MATRIX << line.chomp.chars }
$sum = 0
rows = MATRIX.length
cols = MATRIX[0].length

def valid_position?(row, col, rows, cols)
  row >= 0 && row < rows && col >= 0 && col < cols
end

(0...rows).each do |row|
  num = []
  $valid = false
  (0...cols).each do |col|
    next unless MATRIX[row][col] =~ /\d/
    num << MATRIX[row][col]
    adjacent_positions = [
      [row - 1, col - 1], [row - 1, col], [row - 1, col + 1],
      [row, col - 1],                     [row, col + 1],
      [row + 1, col - 1], [row + 1, col], [row + 1, col + 1]
    ]
    adjacent_positions.each do |r, c|
      if valid_position?(r, c, rows, cols) && MATRIX[r][c] =~ /[^0-9.]/
        $valid = true
        break
      end
    end
    if (valid_position?(row, col+1, rows, cols) && MATRIX[row][col+1] =~ /[^0-9]/ && $valid) \
      || (!valid_position?(row, col+1, rows, cols) && $valid)
      $valid = false
      $sum += num.join.to_i
      num = []
    end
    if MATRIX[row][col+1] =~ /[^0-9]/ && !$valid
      num = []
    end
  end
end
puts $sum