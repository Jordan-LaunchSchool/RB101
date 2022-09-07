

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

total_male_age = 0

# munsters.each do |key, hash|
# 	hash.each do |key, value|
# 		if value == 'male'
# 			total_age += hash['age']
# 		end
# 	end	
# end

munsters.each_value do |value_hash|
	total_male_age += value_hash["age"] if value_hash["gender"] == "male"
end

p total_male_age