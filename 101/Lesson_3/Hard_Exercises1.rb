#Question 1
puts "Question 1:"

if false
  greeting = “hello world”
end

greeting # => nil

puts "-----------------------------------"

#Question 2
puts "Question 2:"

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings # => {:a=>"hi there"}

puts "-----------------------------------"

#Question 3
puts "Question 3:"

def mess_with_vars(one, two, three)
  one = two # => "two" 
  two = three # => "three"
  three = one # => "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # => "one"
puts "two is: #{two}" # => "two"
puts "three is: #{three}" # => "three"

def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # => "one"
puts "two is: #{two}" # => "two"
puts "three is: #{three}" # => "three"

def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # => "two"
puts "two is: #{two}" # => "three"
puts "three is: #{three}" # => "one"

puts "-----------------------------------"

#Question 4
puts "Question 4:"

def generate_UUID
  characters = [] 
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |digit| characters << digit }

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' unless index >= sections.size - 1
  end

  uuid
end

puts "-----------------------------------"

#Question 5
puts "Question 5:"

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")

  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0
  	word = dot_separated_words.pop
  	return false unless is_a_number?(word)
  end
  
  return true
  
end

puts "-----------------------------------"





