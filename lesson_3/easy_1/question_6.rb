# question_6.rb

=begin 
Starting with the string: famous_words = "seven years ago..."
show two different ways to put the expected "Four score and " in front of it.
=end

correct_string = "Four score and seven years ago..."

famous_words = "seven years ago..."
words_to_add = "Four score and "

# words_to_add << famous_words
famous_words.prepend("Four score and ")

p famous_words