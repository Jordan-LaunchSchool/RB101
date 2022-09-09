=begin
 - create an empty array
 - iterate over the arr array using select
	- iterate pver the sub hash using select
		- select those values that all integers are even
			
=end

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]


result_array = 	arr.select do |sub_hash|
									sub_hash.all? do |_, array|
										array.all? do |integer|
											integer.even?
										end
									end
								end

p result_array 