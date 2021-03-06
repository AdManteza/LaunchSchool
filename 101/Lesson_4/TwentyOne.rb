# PseudoCode
# 1. Initialize deck
# 2. Deal cards to player and dealer
# 3. Player turn: hit or stay
# - repeat until bust or "stay"
# 4. If player bust, dealer wins.
# 5. Dealer turn: hit or stay
# - repeat until total >= 17
# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner.
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Ace',
          'Jack', 'Queen', 'King'].freeze

SUITS = ['Clubs', 'Diamonds', 'Hearts', 'Spades'].freeze

DEALER_STAY_AT_VALUE = 17

WINNING_CARD_TOTAL = 21

WINNING_ROUND_SCORE = 5

player_score = 0

dealer_score = 0

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def get_valid_choice(message, valid_choices)
  choice = ''
  loop do
    prompt message
    choice = gets.chomp.downcase
    break if choice == valid_choices[0] || choice == valid_choices[1]
    prompt "Sorry, that's not a valid choice."
  end
  choice
end

def get_card_values(cards)
  cards.map { |card| card[1] }
end

def count_number_of_aces(card_values)
  aces = card_values.select { |card| card == 'Ace' }
  aces.count
end

def total(cards)
  values = get_card_values(cards)

  sum = 0

  values.each do |value|
    sum += if value == 'Ace'
             11
           elsif value.to_i == 0
             10
           else
             value.to_i
           end
  end

  count_number_of_aces(values).times do
    sum -= 10 if sum > WINNING_CARD_TOTAL
  end

  sum
end

def busted?(cards)
  total(cards) > WINNING_CARD_TOTAL
end

def detect_result(dealer_cards, player_cards)
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  if player_total > WINNING_CARD_TOTAL
    :player_busted
  elsif dealer_total > WINNING_CARD_TOTAL
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_result(dealer_cards, player_cards)
  result = detect_result(dealer_cards, player_cards)

  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    prompt "Dealer busted! You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
end

def display_grand_output(dealer_cards, player_cards)
  puts "====================================================================="
  prompt "Dealer has #{dealer_cards}, for a total of: #{total(dealer_cards)}"
  prompt "Player has #{player_cards}, for a total of: #{total(player_cards)}"
  puts "====================================================================="
end

def play_again?
  puts "--------------------"
  valid_choices = ['y', 'n']
  answer = get_valid_choice("Do you want to play again? y/n", valid_choices)
  return true if answer == 'y'
end

def display_scores(player_score, dealer_score)
  prompt "Player score = #{player_score}"
  prompt "Dealer score = #{dealer_score}"

  announce_winner_of_round(player_score, dealer_score)
end

def announce_winner_of_round(player_score, dealer_score)
  prompt("Congratulations!! You have won this round!!") if player_score == WINNING_ROUND_SCORE
  prompt("Sorry!! You have lost this round!!") if dealer_score == WINNING_ROUND_SCORE
end

def end_of_previous_round(player_score, dealer_score)
  player_score == WINNING_ROUND_SCORE || dealer_score == WINNING_ROUND_SCORE
end

loop do
  prompt "Welcome to the card game Twenty-One!!!"

  deck = initialize_deck

  if end_of_previous_round(player_score, dealer_score)
    player_score = 0
    dealer_score = 0
  end

  player_cards = []
  dealer_cards = []

  2.times do
    player_cards << deck.shuffle.pop
    dealer_cards << deck.shuffle.pop
  end

  player_card_total = total(player_cards)

  prompt "Dealer has #{dealer_cards[0]} and ?"
  prompt "You have: #{player_cards[0]} and #{player_cards[1]}, for a total of #{player_card_total}."

  # player turn:

  loop do
    valid_choices = ['h', 's']
    player_turn = get_valid_choice("Would you like to (h)it or (s)tay?", valid_choices)

    if player_turn == 'h'
      player_cards << deck.shuffle.pop
      player_card_total = total(player_cards)
      prompt "You chose to hit!"
      prompt "Your cards are now: #{player_cards}, for a total of #{player_card_total}"
    end

    break if player_turn == 's' || busted?(player_cards)
  end

  if busted?(player_cards)
    display_grand_output(dealer_cards, player_cards)
    display_result(dealer_cards, player_cards)
    dealer_score += 1
    display_scores(player_score, dealer_score)
    play_again? ? next : break
  else
    prompt "You stayed at #{player_card_total}"
  end

  # dealer turn
  prompt "Dealer turn..."

  dealer_card_total = total(dealer_cards)

  loop do
    break if busted?(dealer_cards) || dealer_card_total >= DEALER_STAY_AT_VALUE

    prompt "Dealer hits!"
    dealer_cards << deck.shuffle.pop
    dealer_card_total = total(dealer_cards)
    prompt "Dealer's cards are now #{dealer_cards}"
    prompt "Dealer total is now: #{dealer_card_total}"
  end

  if busted?(dealer_cards)
    display_grand_output(dealer_cards, player_cards)
    display_result(dealer_cards, player_cards)
    player_score += 1
    display_scores(player_score, dealer_score)
    play_again? ? next : break
  else
    prompt "Dealer stays at #{dealer_card_total}"
  end

  display_grand_output(dealer_cards, player_cards)

  display_result(dealer_cards, player_cards)

  result = detect_result(dealer_cards, player_cards)

  player_score += 1 if result == :player || result == :tie
  dealer_score += 1 if result == :dealer || result == :tie

  display_scores(player_score, dealer_score)

  break unless play_again?
end

prompt "Thank you for playing Twent-One! Good bye!"
