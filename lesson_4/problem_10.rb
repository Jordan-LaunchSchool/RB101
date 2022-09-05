
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# munsters.each do |key, value|
# 	value["age_group"] = if value["age"].between?(0, 17)
# 											 	"kid"
# 											 elsif value["age"].between?(18, 64)
# 											 	"adult"
# 											 else
# 											 	"senior"
# 											 end
# end

munsters.each do |key, value|
	value["age_group"] = case value["age"]
											 when 0...18
												"kid"
											 when 18...65
												"adult"
											 else
												"senior"
											 end
end
										

p munsters

