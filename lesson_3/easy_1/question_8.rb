# question_8.rb

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

flintstones =  flintstones.select do |name, number|
                name == 'Barney'
               end

flintstones.to_a.flatten

flintstones.assoc("Barney")