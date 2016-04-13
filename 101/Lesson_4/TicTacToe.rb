require 'pry'

PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
INITIAL_MARKER = ' '
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals

WINNING_SCORE = 5

player_score = 0
computer_score = 0

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd)
  system 'clear'

  puts "Player is #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts "     |     |"
  puts ""
end

def joinor(array)
  array[-1] = "or #{array.last}" if array.size > 1
  array.join(', ')
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''

  loop do
    prompt "Choose a square #{joinor(empty_squares(brd))}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select { |key, value| line.include?(key) && value == INITIAL_MARKER }.keys.first
  end
end

def computer_places_piece!(brd)
  square = nil

  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end

  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  square = 5 if brd[5] == INITIAL_MARKER && !square

  square = empty_squares(brd).sample if !square

  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def display_score(player_score, computer_score)
  prompt("Player Score = #{player_score}")
  prompt("Computer Score = #{computer_score}")
end

def announce_winner(player_score, computer_score)
  prompt("Congratulations!! You have won this round!!") if player_score == 5
  prompt("Sorry!! You have lost this round!!") if computer_score == 5
end

def all_equal?(array)
  array.uniq.size <= 1
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd[line[0]] == PLAYER_MARKER &&
       brd[line[1]] == PLAYER_MARKER &&
       brd[line[2]] == PLAYER_MARKER
      return 'Player'
    elsif brd[line[0]] == COMPUTER_MARKER &&
          brd[line[1]] == COMPUTER_MARKER &&
          brd[line[2]] == COMPUTER_MARKER
      return 'Computer'
    end
  end
  nil
end

def get_user_input(message)
  answer = ''

  loop do
    prompt message
    answer = gets.chomp.downcase
    break if answer == 'y' || answer == 'n'
    prompt "Sorry, that's not a valid choice."
  end
  answer
end

def place_piece!(brd, current_player)
  player_places_piece!(brd) if current_player == 'Human'
  display_board(brd)
  computer_places_piece!(brd) if current_player == 'AI'
end

def alternate_player(current_player)
  return "Human" if current_player == "AI"
  return "AI" if current_player == "Human"
end

def choose_current_player(initial_turn)
  if initial_turn == 'y'
    return "Human"
  else
    return 'AI'
  end
end

loop do
  board = initialize_board

  system 'clear'
  initial_turn = get_user_input("Would you like to make the first move? y/n")
  current_player = choose_current_player(initial_turn)

  loop do
    display_board(board)

    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
    player_score += 1 if detect_winner(board) == 'Player'
    computer_score += 1 if detect_winner(board) == 'Computer'
    display_score(player_score, computer_score)
  else
    prompt "It's a tie!"
  end

  if player_score == WINNING_SCORE || computer_score == WINNING_SCORE
    announce_winner(player_score, computer_score)
    player_score = 0
    computer_score = 0
  end

  break if get_user_input("Play again? (y or n)") == 'n'
end

prompt "Thanks for Playing"
