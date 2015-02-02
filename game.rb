=begin
This Kata is about implementing a simple tennis game. I came up with it while thinking about Wii tennis, where they have simplified tennis, so each set is one game.

The scoring system is rather simple:

1. Each player can have either of these points in one game 0 15 30 40

2. If you have 40 and you win the ball you win the game, however there are special rules.

3. If both have 40 the players are deuce. a. If the game is in deuce, the winner of a ball will have advantage and game ball. b. If the player with advantage wins the ball he wins the game c. If the player without advantage wins they are back at deuce.
=end

require 'pry'
require './player'

class Tennis_game 

  attr_accessor :player1
  attr_accessor :player2 
  attr_accessor :scoreboard

  
  def initialize player1, player2
    @player1 = player1
    @player2 = player2
    @scoreboard = [0,0]
  end

  
  def show_scoreboard
    scoreboard
  end

  
  def score player
    player.points+=1
    update_scoreboard
  end

  
  def update_scoreboard
    determine_player_scores player1
    determine_player_scores player2
    points_difference_between_players = (player1.points - player2.points).abs
    update_scoreboard_if_deuce_winner_or_advantage points_difference_between_players
  end

  
  def determine_player_scores player
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


  def update_scoreboard_if_deuce_winner_or_advantage points_difference_between_players
    if are_scores_equal_and_over_30_points?
      update_scoreboard_with_deuce
    elsif at_least_one_player_over_40_points?
      if points_difference_between_players >=2
        determine_winner
      else points_difference_between_players == 1
        determine_the_player_with_advantage
      end
    end
  end

  
  def are_scores_equal_and_over_30_points?
    equal_scores = player1.points == player2.points
    scores_over_30 = (player1.points > 3 and player2.points > 3)
    equal_scores and scores_over_30
  end


  def at_least_one_player_over_40_points?
    one_player_over_40_point = @scoreboard[0] == '+40' or @scoreboard[1] == '+40'
    both_players_over_40_points = @scoreboard[0] == '+40' and @scoreboard[1] == '+40'
    both_players_over_40_points or one_player_over_40_point
  end

  
  def update_scoreboard_with_deuce
    @scoreboard[0] = 'Deuce'
    @scoreboard[1] = ''
  end

  
  def determine_winner
    if player1.points > player2.points
      @scoreboard[0] = 'Winner'
      @scoreboard[1] = 'Looser'
    else
      @scoreboard[0] = 'Looser'
      @scoreboard[1] = 'Winner'
    end
  end

  
  def determine_the_player_with_advantage
    if player1.points > player2.points
      @scoreboard[0] = 'Advantage'
      @scoreboard[1] = ''
    else
      @scoreboard[0] = ''
      @scoreboard[1] = 'Advantage'
    end 
  end


end