require 'pry'

def prompt(msg)
  puts "=> #{msg}"
end

def alternate_player(current_player)
  return "Human" if current_player == "AI"
  return "AI" if current_player == "Human"
end

def place_piece(current_player)
	prompt "Piece placed by #{current_player}"
end

current_player = 'AI'

value = alternate_player(current_player)
puts value


	prompt "Display board"
	place_piece(current_player)
	current_player = alternate_player(current_player)
	place_piece(current_player)