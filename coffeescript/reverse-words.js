var reverse_words, reverse_words_manually;

reverse_words = function(sentence) {
    return sentence.split(' ').reverse.join(' ');
};

reverse_words_manually = function(sentence) {
    var curr_word, reversed;
    curr_word = '';
    reversed = (sentence.split('').reduce(function(reversed_sentence, char) {
        if (char === ' ') {
            reversed_sentence.unshift(curr_word);
            curr_word = '';
        } else {
            curr_word += char;
        }
        return reversed_sentence;
    }, [])).join(' ');
    return curr_word + ' ' + reversed;
};
