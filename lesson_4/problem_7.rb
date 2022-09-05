
statement = "The Flintstones Rock"

statement_hash = {}
statement.chars.each do |char|
	next if char == ' '
	statement_hash[char] = statement.count(char)
end

p statement_hash