COUNT = 1000
LONGEST_SIDE = (COUNT - 1) / 3
parameter_sum = triangle_count = 0

def triangle_area(a, b, c)
  s = 0.5 * a*b*c
  Math.sqrt(s * (s-a) * (s-b) * (s-c))
end

(2..LONGEST_SIDE).each do |side_length|
  area1 = triangle_area side_length, side_length, side_length - 1
  area2 = triangle_area side_length, side_length, side_length + 1
  if area1 % 1 == 0
    parameter_sum += side_length * 3 - 1
    p [side_length, side_length, side_length - 1]
    triangle_count += 1
  end
  if area2 % 1 == 0
    parameter_sum += side_length * 3 + 1
    p [side_length, side_length, side_length + 1]
    triangle_count += 1
  end
end

p "Triangles: #{triangle_count}"
p "Sum: #{parameter_sum}"
# print triangles.reduce {|sides| sides.reduce :+ }