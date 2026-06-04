require_relative 'black_jack'

def state_of_the_game(player_score, bank_score)
  # TODO: return (not print!) a message containing the player's score and bank's score
  "Your score is #{player_score}, bank is #{bank_score}"
end

def end_game_message(player_score, bank_score)
  # TODO: return (not print!) a message telling if the user won or lost.
  if player_score > 21
    "Bust! You lose."
  elsif player_score == 21
    "You pulled a black jack, you win!"
  elsif player_score > bank_score
    "You beat the bank! You win."
  elsif player_score < bank_score
    "The bank beats you, you lose!"
  else 
    "Push. You get your money back."
  end
end


#"You beat the bank! You win." ou "Bust! You lose." ou "Push. You get your money back."
