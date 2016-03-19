#Question 1
puts "Question 1:"

def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]#42

  a_outer_id = a_outer.object_id#85
  b_outer_id = b_outer.object_id#70254902624140 
  c_outer_id = c_outer.object_id#70254910847140
  d_outer_id = d_outer.object_id#85

  # => a_outer is 42 with an id of: 85 before the block.
  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block."
  
  # => b_outer is forty two with an id of: 70254902624140 before the block.
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block."
  
  # => c_outer is [42] with an id of: 70254910847140 before the block.
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block."
  
  # => d_outer is 42 with an id of: 85 before the block.
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block.\n\n"

  1.times do
    a_outer_inner_id = a_outer.object_id#85
    b_outer_inner_id = b_outer.object_id#70254902624140 
    c_outer_inner_id = c_outer.object_id#70254910847140
    d_outer_inner_id = d_outer.object_id#85

    # => a_outer id was 85 before the block and is: 85 inside the block.
    puts "a_outer id was #{a_outer_id} before the block and is: #{a_outer.object_id} inside the block."
    
    # => b_outer id was 70254902624140 before the block and is: 70254902624140 inside the block.
    puts "b_outer id was #{b_outer_id} before the block and is: #{b_outer.object_id} inside the block."
    
    # => c_outer id was 70254910847140 before the block and is: 70254910847140 inside the block.
    puts "c_outer id was #{c_outer_id} before the block and is: #{c_outer.object_id} inside the block."
    
    # => d_outer id was 85 before the block and is: 85 inside the block.
    puts "d_outer id was #{d_outer_id} before the block and is: #{d_outer.object_id} inside the block.\n\n"

    a_outer = 22
    b_outer = "thirty three"
    c_outer = [44]
    d_outer = c_outer[0]#44

    # => a_outer inside after reassignment is 22 with an id of: 85 before and: 45 after.
    puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."
    
    # => b_outer inside after reassignment is thirty three with an id of: 70254902624140  before and: 70361798426260 after.
    puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."
    
    # => c_outer inside after reassignment is [44] with an id of: 70254910847140 before and: #70254910847140 after.
    puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after."
    
    # => d_outer inside after reassignment is 44 with an id of: 85 before and: 89 after.
    puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after.\n\n"


    a_inner = a_outer#22
    b_inner = b_outer#thirty three
    c_inner = c_outer#[44]
    d_inner = c_inner[0]#44

    a_inner_id = a_inner.object_id#45
    b_inner_id = b_inner.object_id#70361794895620 
    c_inner_id = c_inner.object_id#70361794889240 
    d_inner_id = d_inner.object_id#89

    # => a_inner is 22 with an id of: 45 inside the block (compared to 45 for outer).
    puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the block (compared to #{a_outer.object_id} for outer)."
    
    # => b_inner is thirty three with an id of: 70361794895620  inside the block (compared to 70361798426260 for outer).
    puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the block (compared to #{b_outer.object_id} for outer)."
    
    # => c_inner is [44] with an id of: 70361794889240 inside the block (compared to 70254910847140 for outer).
    puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the block (compared to #{c_outer.object_id} for outer)."
    
    # => d_inner is 44 with an id of: 89 inside the block (compared to 89 for outer).
    puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the block (compared to #{d_outer.object_id} for outer).\n\n"
  end

  # => a_outer is 22 with an id of: 85 BEFORE and: 45 AFTER the block.
  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the block."
  
  # => b_outer is thirty three with an id of: 70313027356200 BEFORE and: 70313027356200 AFTER the block.
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the block."
  
  # => c_outer is [44] with an id of: 70254910847140 BEFORE and: 70313018807420 AFTER the block.
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the block."
  
  # => d_outer is 44 with an id of: 85 BEFORE and: 89 AFTER the block.
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the block.\n\n"

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the block.\n\n" rescue puts "ugh ohhhhh"
end

fun_with_ids

puts "-----------------------------------"

#Question 2
puts "Question 2:"

def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]

  a_outer_id = a_outer.object_id#85
  b_outer_id = b_outer.object_id#70307721660500 
  c_outer_id = c_outer.object_id#70307721574940 
  d_outer_id = d_outer.object_id#85

  # => a_outer is 42 with an id of: 85 before the block.
  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block."

  # => b_outer is forty two with an id of: 70307721660500 before the block.
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block."

  # => c_outer is [42] with an id of: 70307721574940 before the block.
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block."

  # => d_outer is 42 with an id of: 85 before the block.
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block.\n\n"

  an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)

  # => a_outer is 42 with an id of: 85 BEFORE and: 85 AFTER the method call.
  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the method call."
  
  # => b_outer is forty two with an id of: 70307721660500 BEFORE and: 70307721660500 AFTER the method call.
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the method call."
  
  # => c_outer is [42] with an id of: 70307721574940 BEFORE and: 70307721574940 AFTER the method call.
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the method call."
  
  # => d_outer is 42 with an id of: 85 BEFORE and: 85 AFTER the method call.
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the method call.\n\n"

  # => ugh ohhhhh
  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  
  # => ugh ohhhhh
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  
  # => # => ugh ohhhhh
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  
  # => ugh ohhhhh
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the method.\n\n" rescue puts "ugh ohhhhh"
end


def an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)
  a_outer_inner_id = a_outer.object_id#85
  b_outer_inner_id = b_outer.object_id#70307721660500
  c_outer_inner_id = c_outer.object_id#70307721574940 
  d_outer_inner_id = d_outer.object_id#85

  # => a_outer id was 85 before the method and is: 85 inside the method.
  puts "a_outer id was #{a_outer_id} before the method and is: #{a_outer.object_id} inside the method."
  
  # => b_outer id was 70307721660500 before the method and is: 70307721660500 inside the method.
  puts "b_outer id was #{b_outer_id} before the method and is: #{b_outer.object_id} inside the method."
  
  # => c_outer id was 70307721574940 before the method and is: 70307721574940 inside the method.
  puts "c_outer id was #{c_outer_id} before the method and is: #{c_outer.object_id} inside the method."
  
  # => d_outer id was 85 before the method and is: 85 inside the method.
  puts "d_outer id was #{d_outer_id} before the method and is: #{d_outer.object_id} inside the method.\n\n"

  a_outer = 22
  b_outer = "thirty three"
  c_outer = [44]
  d_outer = c_outer[0]

  # => a_outer inside after reassignment is 22 with an id of: 85 before and: 45 after.
  puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."
  
  # => b_outer inside after reassignment is thirty three with an id of: 70307721660500 before and: 70307700424100 after.
  puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."
  
  # => c_outer inside after reassignment is [44] with an id of: 70307721574940 before and: 70307700417740 after.
  puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after."
  
  # => d_outer inside after reassignment is 44 with an id of: 85 before and: 89 after.
  puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after.\n\n"

  a_inner = a_outer#22
  b_inner = b_outer#thirty three
  c_inner = c_outer#[44]
  d_inner = c_inner[0]#[44][0]

  a_inner_id = a_inner.object_id
  b_inner_id = b_inner.object_id
  c_inner_id = c_inner.object_id
  d_inner_id = d_inner.object_id

  # => a_inner is 22 with an id of: 45 inside the method (compared to 45 for outer).
  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the method (compared to #{a_outer.object_id} for outer)."
  
  # => b_inner is thirty three with an id of: 70307721577360 inside the method (compared to 70307721577360 for outer).
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the method (compared to #{b_outer.object_id} for outer)."
  
  # => c_inner is [44] with an id of: 70307705443200 inside the method (compared to 70307705443200 for outer).
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the method (compared to #{c_outer.object_id} for outer)."
  
  # => d_inner is 44 with an id of: 89 inside the method (compared to 89 for outer).
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the method (compared to #{d_outer.object_id} for outer).\n\n"
end

puts "-----------------------------------"

#Question 3
puts "Question 3:"

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]

tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
# => My string looks like this now: pumpkins

puts "My array looks like this now: #{my_array}"
# => My array looks like this now: ["pumpkins, "rutabaga"]

puts "-----------------------------------"

#Question 4
puts "Question 4:"

def tricky_method_two(a_string_param, an_array_param)
  a_string_param.gsub!('pumpkins', 'rutabaga')
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
# => My string looks like this now: rutabaga

puts "My array looks like this now: #{my_array}"
# => My array looks like this now: ["pumpkins"]

puts "-----------------------------------"

#Question 5
puts "Question 5:"

def color_valid(color)
  color == "blue" || color == "green"
end

puts "-----------------------------------"



















