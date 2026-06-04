require_relative "croupier"
require_relative "black_jack"


# TODO: make the user play from terminal in a while loop that will stop
#       when the user will not be asking for  a new card

#pick the bank score
bank_score = pick_bank_score
#initialize the player score to 0
player_score = 0
loop = true
#ask the player if he wants a new card
while loop
  puts "Card? y or yes to get a new card"
  player_answer = gets.chomp.downcase
  if ['y', 'yes'].include?(player_answer)
    player_score += pick_player_card
    #print the state of the game (player score and bank score)
    puts state_of_the_game(player_score, bank_score)
    loop = player_score < 21
  else
    loop = false
  end
end
#if the player does not want a new card, end the game and print the final message
puts end_game_message(player_score, bank_score)
