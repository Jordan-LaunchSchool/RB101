ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, 
				"Marilyn" => 22, "Spot" => 237 }

total_munster_age = 0

ages.each do |_, value|
	total_munster_age += value
end

p total_munster_age