#Question 1
puts "Question 1:"

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers # Prints out 1,2,2,3

puts "--------------------------"

#Question 2
puts "Question 2:"

puts "1.) != is a Ruby operator that means 'not equal to'"

#2.) put ! before something, like !user_name
user_name = "name"
puts "2.) #{!user_name}" # !user_name returns false

puts "3.) words.uniq! removes duplicate elements in the array words by modifying the original words array"
puts "4.) ?: Is a conditional expression. If condition is true? then value X: otherwise value Y"
puts "5.) ? after something checks if the preceding method returns true"

#6.) put !! before something, like !!user_name
puts "6.) #{!!user_name}" #user_name returns true

#Question 3
puts "Question 3:"

advice = "Few things in life are as important as house training your pet dinosaur."

advice.gsub! 'important', 'urgent'

puts advice

puts "--------------------------"

#Question 4

#numbers = [1,2,3,4,5]
#1. numbers.delete_at(1) => numbers = [1,3,4,5]
#2. numbers.delete(1) => numbers = [2,3,4,5] 

#Question 5

#Determine if 42 lies between 10 and 100

def determine_42
	(10..100).include?(42)
end

#Question 6
puts "Question 6:"

famous_words = "seven years ago..."

puts "Four score and " + famous_words
puts "Four score and #{famous_words}"

puts "--------------------------"

#Question 7
puts "Question 7:"

def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep

puts eval(how_deep) #Prints out 42

puts "--------------------------"

#Question 8
puts "Question 8:"

array = ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]

puts array.flatten

puts "--------------------------"

#Question 9
puts "Question 9:"

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, 
								"BamBam" => 4, "Pebbles" => 5 }

flintstones.assoc("Barney")

puts "--------------------------"

#Question 10

puts "Question 10:"

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

hash = {}

flintstones.each_with_index do |value, index|
	hash[value] = index
end

puts hash

















