#Question 1
puts "Question 1:"

flintstones = %W("Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles")

puts "-----------------------------------"

#Question 2
puts "Question 2:"

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

puts flintstones.push("Dino")

puts "-----------------------------------"

#Question 3
puts "Question 3:"

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

puts flintstones += ["Dino", "Hoppy"]

puts "-----------------------------------"

#Question 4
puts "Question 4:"

advice = "Few things in life are as important as house training your pet dinosaur."

puts advice.slice(39..73)

puts "-----------------------------------"

#Question 5
puts "Question 5:"

statement = "The Flintstones Rock!"

puts statement.scan("t").count

puts "-----------------------------------"

#Question 6
puts "Question 6:"

title = "Flintstone Family Members"

puts title.center(40)

puts "-----------------------------------"