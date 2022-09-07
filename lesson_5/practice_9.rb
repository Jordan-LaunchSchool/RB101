
=begin
	- begin iterating over the array
		- begin a sort by iteration and sort in descending order

=end


arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr.map do |sub_array|
	sub_array.sort! do |a, b|
		b <=> a
	end
end

p arr 