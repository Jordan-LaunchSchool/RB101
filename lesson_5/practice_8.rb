=begin
	- create an empty string called vowels
 - create an array including containing vowels.
 - iterate over the hash
	- iterate over the value of the hash, an array
		- iterate over each character of the element
			- if the vowels arracy includes a character, add it to the vowels variable


=end


hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

VOWELS = ['a', 'e', 'i', 'o', 'u']
vowels_result = []

hsh.each do |_, value|
	value.each do |element|
		element.chars do |char|
			vowels_result << char if VOWELS.include?(char)
		end
	end
end

p vowels_result