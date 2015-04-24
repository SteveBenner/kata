# Create a function that will reverse the words in a sentence.

# the easy way
reverse_words = (sentence) ->
  sentence.split(' ').reverse.join ' '

# manually
reverse_words_manually = (sentence) ->
  curr_word = ''
  reversed = (sentence.split('').reduce (reversed_sentence, char) ->
    if char == ' '
      reversed_sentence.unshift curr_word
      curr_word = ''
    else
      curr_word += char
    reversed_sentence
  , []).join ' '
  curr_word + ' ' + reversed