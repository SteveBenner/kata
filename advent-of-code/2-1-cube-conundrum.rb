# 2-1: Cube Conundrum
CONSTRAINT = {red: 12, green: 13, blue: 14}
sum = 0
File.foreach '2-input' do |line|
  bad_sets = 0
  game_id = line.match(/Game (\d+)/)[1]
  line.scan /Game \d+: (((\d+ (red|green|blue),?);? ?)+)+/ do |matches|
    # puts "line #{$line}: #{game_id}"
    set = matches.first
    set.scan /(\d+?) (red|green|blue)/ do |cubes|
      count, color = cubes[0].to_i, cubes[1]
      bad_sets += 1 if CONSTRAINT[color.to_sym] < count
    end
    if bad_sets > 0
      bad_sets = 0
    else
      sum += game_id.to_i
    end
  end
end
puts sum