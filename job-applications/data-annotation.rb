# In this exercise, you will develop a function named decode(message_file). This function should read an encoded message
# from a .txt file and return its decoded version as a string.
#
# Your function must be able to process an input file with the following format:
#
# 3 love
# 6 computers
# 2 dogs
# 4 cats
# 1 I
# 5 you
#
# In this file, each line contains a number followed by a word. The task is to decode a hidden message based on the
# arrangement of these numbers into a "pyramid" structure. The numbers are placed into the pyramid in ascending order,
# with each line of the pyramid having one more number than the line above it. The smallest number is 1, and the numbers
# increase consecutively, like so:
#
#   1
#  2 3
# 4 5 6
#
# The key to decoding the message is to use the words corresponding to the numbers at the end of each pyramid line
# (in this example, 1, 3, and 6). You should ignore all the other words. So for the example input file above, the
# message words are:
#
# 1: I
# 3: love
# 6: computers
#
# ... and your function should return the string "I love computers".
def decode(message_file)
  # Read the input file and store number-word pairs in a hash
  number_word_pairs = {}
  File.foreach(message_file) do |line|
    number, word = line.strip.split ' '
    number_word_pairs[number.to_i] = word
  end

  # Find the maximum number in the dictionary
  max = number_word_pairs.keys.max

  # Initialize variables for tracking the pyramid structure
  current_row_length = 1
  current_row_sum = 0
  decoded_words = []

  # Iterate over the numbers to find message components
  1.upto(max) do |number|
    current_row_sum += number

    # If the current number is at the end of a pyramid line, retrieve the corresponding word
    if current_row_sum == (current_row_length * (current_row_length + 1) / 2)
      decoded_words << number_word_pairs[current_row_sum]
      current_row_length += 1
    end
  end

  # Concatenate retrieved words to form the decoded message
  decoded_words.join ' '
end
puts decode '/Users/sven/Downloads/coding_qual_input.txt'