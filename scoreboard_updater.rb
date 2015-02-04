

class Scoreboard_updater 


  def update_scoreboard_with_deuce scoreboard
    scoreboard[0] = 'Deuce'
    scoreboard[1] = ''
  end

  
  def determine_winner scoreboard, player1, player2
    if player1.points > player2.points
      scoreboard[0] = 'Winner'
      scoreboard[1] = 'Looser'
    else
      scoreboard[0] = 'Looser'
      scoreboard[1] = 'Winner'
    end
  end

  
  def determine_the_player_with_advantage scoreboard, player1, player2
    if player1.points > player2.points
      scoreboard[0] = 'Advantage'
      scoreboard[1] = ''
    else
      scoreboard[0] = ''
      scoreboard[1] = 'Advantage'
    end 
  end


end