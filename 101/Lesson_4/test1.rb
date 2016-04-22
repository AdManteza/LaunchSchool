

def reset_scores(player_score, dealer_score)
  player_score = 0
  dealer_score = 0

  return player_score, dealer_score
end

player_score = 0
dealer_score = 1

3.times do
	player_score += 1
end

2.times do
	dealer_score += 2
end

puts player_score, dealer_score
puts "========================="
scores = []

reset_scores(player_score, dealer_score)


puts "========================="
puts player_score, dealer_score
