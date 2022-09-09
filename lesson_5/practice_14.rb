=begin
	- create empty array
	- interate over the hash
		- iterater over the value/sub_hash, 
				- add the value of the colour (capitals) if the type is equal to fruit
				- add the value of the size (uppercase) if the type is equal to vegetables

=end


hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

result_array = []

hsh.map do |_, sub_hash|
		if sub_hash[:type] == "fruit"
			result_array << sub_hash[:colors].map do |color|
				color.capitalize
			end
		else
			result_array << sub_hash[:size].upcase if sub_hash[:type] == "vegetable"
		end
end

p result_array
