#Question 1
puts "Question 1:"

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

puts ages.include?("Spot") #returns false

puts "-----------------------------------"

#Question 2
puts "Question 2:"

puts ages.values.inject(:+) #output is 474

puts "-----------------------------------"

#Question 3
puts "Question 3:"

puts ages.select { |k,v| v < 100 }

puts "-----------------------------------"

#Question 4
puts "Question 4:"

munsters_description = "The Munsters are creepy in a good way."

# outputs "The munsters are creepy in a good way."
puts munsters_description.capitalize 

# outputs "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
puts munsters_description.swapcase

# outputs "the munsters are creepy in a good way."
puts munsters_description.downcase

# outputs "THE MUNSTERS ARE CREEPY IN A GOOD WAY."
puts munsters_description.upcase

puts "-----------------------------------"

#Question 5
puts "Question 5:"

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }

additional_ages = { "Marilyn" => 22, "Spot" => 237 }

puts ages.merge(additional_ages) # outputs the combined hash

puts "-----------------------------------"

#Question 6
puts "Question 6:"

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }

puts ages.values.min # outputs 10

puts "-----------------------------------"

#Question 7
puts "Question 7:"

advice = "Few things in life are as important as house training your pet dinosaur."

puts advice.include?("Dino") # outputs false

puts "-----------------------------------"

#Question 8
puts "Question 8:"

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

puts flintstones.index { |name| name[0, 2] == "Be" }

puts "-----------------------------------"

#Question 9
puts "Question 9:"

puts (flintstones.map do |name| 
	name[0..2] 
end)

puts "-----------------------------------"

#Question 10
puts "Question 10:"

puts flintstones.map { |name| name[0..2] } 

puts "-----------------------------------"










