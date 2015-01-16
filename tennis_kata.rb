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

  def initialize player1, player2
    @player1 = player1
    @player2 = player2
  end

  def score player
    if player.points == 0
      player.points = 15
    else
      player.points = 30
    end
  end

end

class Player
  def initialize
    @points = 0
  end
  attr_accessor :points
end