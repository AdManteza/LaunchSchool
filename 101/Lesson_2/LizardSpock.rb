choice_to_number = { "r" => 0, "sp" => 1, "p" => 2,
                     "l" => 3, "s" => 4 }

choice_hash = { "r" => "rock", "p" => "paper",
                "s" => "scissors", "l" => "lizard",
                "sp" => "spock" }

player_choice = ''
player_score = 0
computer_score = 0

choice_prompt = <<-MSG
  1.)r - for 'rock'
  2.)p - for 'paper'
  3.)s - for 'scissors'
  4.)l - for 'lizard'
  5.)sp - for 'spock'
MSG

def prompt(message)
  Kernel.puts("=>#{message}")
end

def determine_winner(player, computer)
  difference = (player - computer) % 5

  return 'It is a Tie for this round' if difference == 0
  return 'The Player won this round!!' if difference == 1 || difference == 2
  'The Computer won this round!!'
end

def generate_random_number
  random_number = Random.new
  random_number.rand(1...5)
end

def display_score(player_score, computer_score)
  prompt("Player Score = #{player_score}")
  prompt("Computer Score = #{computer_score}")
end

def announce_winner(player_score, computer_score)
  prompt("Congratulations!! You have won!!") if player_score == 5
  prompt("Sorry!! You have lost!!") if computer_score == 5
end

loop do
  loop do
    prompt("Choose one from the given choices below:")
    Kernel.puts(choice_prompt)
    player_choice = Kernel.gets().chomp()

    break if choice_hash.include?(player_choice)

    prompt("That's not a valid choice!")
  end
  player_number = choice_to_number[player_choice]
  computer_choice_number = generate_random_number

  prompt("Player choice is: #{choice_hash[player_choice]}")
  prompt("Computer choice is: #{choice_hash[choice_to_number.key computer_choice_number]}")

  winner = determine_winner(player_number, computer_choice_number)

  prompt(winner)

  player_score += 1 if winner == 'The Player won this round!!'
  computer_score += 1 if winner == 'The Computer won this round!!'

  display_score(player_score, computer_score)

  announce_winner(player_score, computer_score)

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

display_score(player_score, computer_score) if player_score < 5 || computer_score < 5

prompt("Thanks for playing!!")
