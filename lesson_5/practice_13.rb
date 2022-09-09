


# [[1, 8, 3], [1, 5, 9], [6, 1, 7], [1, 6, 9]]

arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

new_arr = arr.sort_by do |sub_array|
						sub_array.select do |int|
							int.odd?
						end
					end

p new_arr
p arr