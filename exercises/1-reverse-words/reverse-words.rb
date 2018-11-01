# Create a function that will reverse the words in a sentence.

# the easy way
def reverse_words(sentence)
	sentence.split(' ').reverse.join ' '
end

# manually
def reverse_words_manually(sentence)
	curr_word = ''
	sentence.chars.reduce([]) { |reversed, char|
		if char == ' '
			reversed.unshift curr_word
			curr_word = ''
		else
			curr_word << char
		end
		reversed
	}.join(' ').prepend "#{curr_word} "
end