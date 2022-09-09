=begin
	- without modifying the original array
		- iterate over the array using map
			- iterate over the hash/element
				- increment each value by 1


=end


original_array = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]


new_array = original_array.map do |element|
							incremented_hash = {}
							element.each do |key, value|
								incremented_hash[key] = value + 1
							end
							incremented_hash
						end

# original_array.map do |hsh|
#   incremented_hash = {}
#   hsh.each do |key, value|
#     incremented_hash[key] = value + 1
#   end
#   incremented_hash
# end

p original_array
p new_array


