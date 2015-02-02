require 'pry'

class Player
  def initialize player_number
    @points = 0
    @number = player_number-1
  end
  attr_accessor :points
  attr_accessor :number
end