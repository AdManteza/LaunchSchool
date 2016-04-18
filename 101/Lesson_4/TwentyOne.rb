require 'pry'
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

# cards = [['H', '3'], ['S', 'Q']]

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def get_valid_choice(message, param1, param2)
  choice = ''
  loop do
    prompt message
    choice = gets.chomp.downcase
    break if choice == param1 || choice == param2
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
    if value == 'Ace'
      sum += 11
    elsif value.to_i == 0
      sum += 10
    else
      sum += value.to_i
    end
  end

  count_number_of_aces(values).times do
    sum -= 10 if sum > 21
  end

  sum
end

def busted?(cards)
  total(cards) > 21
end

def detect_result(dealer_cards, player_cards)
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  if player_total > 21
    :player_busted
  elsif dealer_total > 21
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer_cards
  else
    tie
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

def play_again?
  puts "--------------------"
  answer = get_valid_choice("Do you want to play again? y/n", 'y', 'n')
  return true if answer == 'y'
end

loop do
  prompt "Welcome to the card game Twenty-One!!!"

  deck = initialize_deck

  player_cards = []
  dealer_cards = []

  2.times do
    player_cards << deck.shuffle.pop
    dealer_cards << deck.shuffle.pop
  end

  prompt "Dealer has #{dealer_cards[0]} and ?"
  prompt "You have: #{player_cards[0]} and #{player_cards[1]}, for a total of #{total(player_cards)}."

  # player turn:
  loop do
    # player_turn = ''

    player_turn = get_valid_choice("Would you like to (h)it or (s)tay?", 'h', 's')

    if player_turn == 'h'
      player_cards << deck.shuffle.pop
      prompt "You chose to hit!"
      prompt "Your cards are now: #{player_cards}, for a total of #{total(player_cards)}"
    end

    break if player_turn == 's' || busted?(player_cards)
  end

  if busted?(player_cards)
    display_result(dealer_cards, player_cards)
    play_again? ? next : break
  else
    prompt "You stayed at #{total(player_cards)}"
  end

  # dealer turn
  prompt "Dealer turn..."

  loop do
    break if busted?(dealer_cards) || total(dealer_cards) >= 17

    prompt "Dealer hits!"
    dealer_cards << deck.shuffle.pop
    prompt "Dealer's cards are now #{dealer_cards}"
    prompt "Dealer total is now: #{total(dealer_cards)}"
  end

  if busted?(dealer_cards)
    prompt "Dealer total is now: #{total(dealer_cards)}"
    display_result(dealer_cards, player_cards)
    play_again? ? next : break
  else
    prompt "Dealer stays at #{total(dealer_cards)}"
  end

  puts "=============="
  prompt "Dealer has #{dealer_cards}, for a total of: #{total(dealer_cards)}"
  prompt "Player has #{player_cards}, for a total of: #{total(player_cards)}"
  puts "=============="

  display_result(dealer_cards, player_cards)

  break unless play_again?
end

prompt "Thank you for playing Twent-One! Good bye!"
