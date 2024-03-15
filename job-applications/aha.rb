# Write a ruby function that prints the numbers from 1 to 100.
# But for multiples of three, it prints 'APing' instead of the number and for the multiples of five, it prints 'BPong'.
def aping_bpong
  (1..100).each do |i|
    if i % 3 == 0 && i % 5 == 0
      puts 'APingBPong'
    elsif i % 3 == 0
      puts 'APing'
    elsif i % 5 == 0
      puts 'BPong'
    else
      puts i
    end
  end
end
aping_bpong