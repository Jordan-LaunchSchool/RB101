=begin
  - write a method that take a sentence string an input
  - have the method return the same string with any digits converted to a string of digits


    - create an array of digits
    - create an array of digits as words
    - split the input string into an array
    - iterate over the array, 
    - if the current iteration is included in the number array
    - replace the the current iteration with the equivalent of the digit to word
    - return the array to string
=end


DIGITS = {
  'one' => '1',
  'two' => '2',
  'three' => '3',
  'four' => '4',
  'five' => '5',
  'six' => '6',
  'seven' => '7',
  'eight' => '8',
  'nine' => '9',
  'zero' => '0'
}

def word_to_digit(input_string)
  result = []
  input_string.split.each do |word|
    p word
    if DIGITS.has_key?(word)
      result << DIGITS[word]
    else
      result << word
    end
  end
  result.join(' ')
end

p word_to_digit('Please call me at five five five one two three four. Thanks.')
p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'