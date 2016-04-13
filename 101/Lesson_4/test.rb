require 'pry'

PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
INITIAL_MARKER = ' '

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]] 

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

#def detect_winner(brd)
#  WINNING_LINES.each do |line|
 #   new_array = brd[line[0]]+brd[line[1]]+brd[line[2]]
 #   return 'Player' if new_array.all? { |element| element == PLAYER_MARKER }
 # end
#end

board = initialize_board
puts board
new_array = []
loop do
	counter = 0
	new_array.push(board[counter])
 	counter += 1
 	break if counter == 2
end

puts new_array


# square = empty_squares(brd).sample if !square