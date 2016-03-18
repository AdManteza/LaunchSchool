#Question 1
puts "Question 1:"

10.times { |i| puts (" " * i)	+ "The Flintstones Rock!" }

puts "-----------------------------------"

#Question 2
puts "Question 2:"

statement = "The Flintstones Rock"

def letter_count(string)
	hash = {}

	string.each_char do |char|
		next if char == " "

		hash[char] = 0 unless hash.include?(char)

		hash[char] += 1
	end

	puts hash
end

letter_count(statement)

puts "-----------------------------------"

#Question 3
puts "Question 3:"

puts "the value of 40 + 2 is " + "#{40 + 2}"
a = 40 + 2
puts "the value of 40 + 2 is " + "#{a}"

puts "-----------------------------------"

#Question 4
puts "Question 4:"

#Output is 1,3
numbers = [1,2,3,4]
numbers.each do |number|
	p number
	numbers.shift(1)
end 

#Output is 1,2
numbers = [1,2,3,4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

puts "-----------------------------------"

#Question 5
puts "Question 5:"

def factors(number)
  dividend = number
  divisors = []
  
  loop do
  	break if number == 0 || number < 0
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
    break if dividend == 0
  end
  divisors
end

puts factors(10)

puts "The purpose of (number % dividend == 0) is to check if there is a 
remainder from the division operation of number/dividend"

puts "The purpose of te second to the last line in the method (divisors)
is to return the new value of (divisors)"

puts "-----------------------------------"

#Question 6
puts "Question 6:"

#Modifies the original input argument (buffer)
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end

#Does not modify the original input argument (input_array)
#but instead initializes and returns a new array called buffer
def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end

puts "-----------------------------------"

#Question 7
puts "Question 7:"

#limit = 15 => out of scope variable. It can't be accessed by the method

def fib(first_num, second_num, limit = 15)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"

puts "-----------------------------------"

#Question 8
puts "Question 8:"

def titleize(string)
	string.capitalize
end

puts titleize("string")

puts "-----------------------------------"

#Question 9
puts "Question 9:"

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |key, value|
	case value["age"]
	when (0..17)
		value["age_group"] = "kid"
	when (18..64)
		value["age_group"] = "adult"
	else
		value["age_group"] = "senior"
	end
end

puts munsters

puts "-----------------------------------"
















