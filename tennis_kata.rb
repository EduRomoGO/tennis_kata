=begin
This Kata is about implementing a simple tennis game. I came up with it while thinking about Wii tennis, where they have simplified tennis, so each set is one game.

The scoring system is rather simple:

1. Each player can have either of these points in one game 0 15 30 40

2. If you have 40 and you win the ball you win the game, however there are special rules.

3. If both have 40 the players are deuce. a. If the game is in deuce, the winner of a ball will have advantage and game ball. b. If the player with advantage wins the ball he wins the game c. If the player without advantage wins they are back at deuce.
=end

require 'pry'

class Tennis_game 
  attr_accessor :player1
  attr_accessor :player2 
  attr_accessor :scoreboard

  def initialize player1, player2
    @player1 = player1
    @player2 = player2
    @scoreboard = []
  end

  def score player
    player.points+=1
    update_scoreboard
  end

  def update_scoreboard

    determine_if_points_are_over_or_under_40

    scores_are_over_40_points = @scoreboard[0] == '+40' and @scoreboard[1] == '+40'
    scores_are_equal_to_40_points = @scoreboard[0] == '+40' or @scoreboard[1] == '+40'
    one_player_over_40_points_and_the_other_under = @scoreboard[0] == '+40' or @scoreboard[1] == '+40'

    points_difference_between_players = (player1.points - player2.points).abs

    if scores_are_over_40_points
      if points_difference_between_players >=2
        if player1.points > player2.points
          @scoreboard[0] = 'Winner'
          @scoreboard[1] = 'Looser'
        else
          @scoreboard[0] = 'Looser'
          @scoreboard[1] = 'Winner'
        end
      elsif points_difference_between_players == 1
        if player1.points > player2.points
          @scoreboard[0] = 'Advantage'
          @scoreboard[1] = ''
        else
          @scoreboard[0] = ''
          @scoreboard[1] = 'Advantage'
        end
      else
          @scoreboard[0] = 'Deuce'
          @scoreboard[1] = ''
      end
    elsif scores_are_equal_to_40_points
      if points_difference_between_players >=2
        if player1.points > player2.points
          @scoreboard[0] = 'Winner'
          @scoreboard[1] = 'Looser'
        else
          @scoreboard[0] = 'Looser'
          @scoreboard[1] = 'Winner'
        end
      else
        if player1.points > player2.points
          @scoreboard[0] = 'Advantage'
          @scoreboard[1] = ''
        else
          @scoreboard[0] = ''
          @scoreboard[1] = 'Advantage'
        end
      end
    elsif one_player_over_40_points_and_the_other_under
      if @scoreboard[0] == 40 and @scoreboard[1] == 40
          @scoreboard[0] = 'Deuce'
          @scoreboard[1] = ''
      end
    end

  end

  def determine_if_points_are_over_or_under_40
    determine_player_score_in_scoreboard_if_under_or_equal_40_points player1
    determine_player_score_in_scoreboard_if_under_or_equal_40_points player2
  end

  def determine_player_score_in_scoreboard_if_under_or_equal_40_points player
    case player.points
      when 0
        @scoreboard[player.number] = 0
      when 1
        @scoreboard[player.number] = 15
      when 2
        @scoreboard[player.number] = 30
      when 3
        @scoreboard[player.number] = 40
      else
        @scoreboard[player.number] = '+40'
    end
  end

end

class Player
  def initialize player_number
    @points = 0
    @number = player_number-1
  end
  attr_accessor :points
  attr_accessor :number
end