
=begin
	- iterate over the outter array
		- create variable a result of
			- create an empty hash
			- empty hashes key is equal to the first index of the element 
			and the key is equal to the second index of the element
=end


arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

result_hash = {}

arr.each do |element|
	result_hash[element[0]] = element[1]
end

p result_hash

