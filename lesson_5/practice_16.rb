=begin
=> SCRATCH PAD <=

=> PROBLEM <=
  - write a method that that returns a UUID when called

  Input: none, call the method with no arguments 

  Output: a string, the UUID

  Rules:
    Explicit:
		- the UUID has 5 sections
			- the first is 8 characters in length
			- the second is 4 characters in length
			- the third is 4 characters in length
			- the fourth is 4 chracters in length
			- the fifth is 12 characters in length
		
		- the numbers are to be hexidecimal
		- the characters are to be random
		

    Implicit:
		- the returned string is to be joined with a '-'

=> EXAMPLES <=
 - "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

=> DATA STRUCTURES <=
 - array of hexidecimal characters
 - array of the UUID structure
 - array of result

=> ALGORITHM <=
	- create a constant of the hexidecimal characters
	- create a constants of the uuid string length format

	- define the UUID method
		- create an empty result array
		- iterate over the uuid format,
			- create an empty string
			- for the number of times of the current element iteration
				- randomly select a hexidecimal character and add it to the empty string
			- add the empty string to the result array
		- return the result array joined by a '-'

=> CODE <=

=end

HEXIDECIAMAL_CHARACTERS = Array('0'..'9') + Array('a'..'f')

UUID_FORMAT = [8, 4, 4, 4, 12]

def generate_uuid()
	uuid = []
	UUID_FORMAT.each do |number|
		result = ''
		number.times do 
			result << HEXIDECIAMAL_CHARACTERS.sample
		end
		uuid << result
	end
	uuid.join('-')
end

p uuid
