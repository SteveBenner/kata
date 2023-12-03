# 2-2: Cube Conundrum
CONSTRAINT = {red: 12, green: 13, blue: 14}
sum = 0
File.foreach '2-input' do |line|
  line.scan /Game \d+: (((\d+ (red|green|blue),?);? ?)+)+/ do |matches|
    # puts "line #{$line}: #{game_id}"
    max = {red: 0, green: 0, blue: 0}
    set = matches.first
    set.scan /(\d+?) (red|green|blue)/ do |cubes|
      count, color = cubes[0].to_i, cubes[1]
      if count > max[color.to_sym]
        max[color.to_sym] = count
      end
    end
    sum += max[:red] * max[:green] * max[:blue]
  end
end
puts sum