a = "forty two" #same a c
b = "forty two" #different to a and c
c = a           #same as a

puts a.object_id
puts b.object_id
puts c.object_id