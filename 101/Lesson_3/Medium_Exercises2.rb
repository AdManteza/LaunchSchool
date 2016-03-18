#Question 1
puts "Question 1:"

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}

def get_age_of_males(hash)
	age_of_males = []

	hash.each do |key, value|
	age_of_males.push(value["age"]) if value["gender"] == "male"
	end
	age_of_males
end

def total_age_of_males(input_array)
	input_array.inject{|sum,x| sum + x }
end

p total_age_of_males(get_age_of_males(munsters))

puts "-----------------------------------"

#Question 2
puts "Question 2:"

munsters.each do |name, details|
	p "#{name} is a #{details["age"]} year old #{details["gender"]}"
end

puts "-----------------------------------"

#Question 3
puts "Question 3:"

def tricky_method(string, array)
  string += "rutabaga"
  array << "rutabaga"

  return string, array
end

my_string = "pumpkins"
my_array = ["pumpkins"]
string, array = tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

puts "-----------------------------------"

#Question 4
puts "Question 4:"

sentence = "Humpty Dumpty sat on a wall."

p sentence.split(/\W/).reverse.join(" ") + "."

puts "-----------------------------------"

#Question 5
puts "Question 5:"

answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

p "The output is 34"

puts "-----------------------------------"

#Question 6
puts "Question 6:"

p "The original hash has been modified"

puts "-----------------------------------"

#Question 7
puts "Question 7:"

p "rps(rps(rps('rock', 'paper'), rps('rock', 'scissors')), 'rock')"
p "rps(rps('paper', rps('rock', 'scissors')), 'rock')"
p "rps(rps('paper', 'rock'), 'rock')"
p "rps('paper', 'rock')"
p "paper"

puts "-----------------------------------"

#Question 8
puts "Question 8:"

p "no"

puts "-----------------------------------"






