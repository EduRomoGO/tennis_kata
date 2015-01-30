require './game'
require './player'

RSpec.describe "Tennis game" do

  let(:player1) { Player.new 1}
  let(:player2) { Player.new 2}
  let(:game) { Tennis_game.new player1, player2 }

  it "starts with two players having 0 points each" do
    expect(game.player1.points).to eq(0)
    expect(game.player2.points).to eq(0)
  end

  it "scoreboard, after player one wins a point, is 15 - 0" do
    game.score player1
    expect(game.show_scoreboard).to eq([15,0])
  end

  it "scoreboard, after player one wins two points, is 30 - 0" do
    game.score player1
    game.score player1   
    expect(game.show_scoreboard).to eq([30,0])
  end

  it "scoreboard, after player one wins three points, is 40 - 0" do
    game.score player1
    game.score player1
    game.score player1
    expect(game.show_scoreboard).to eq([40,0])
  end

  it "scoreboard, after player1 wins three points, and player2 wins one point is 40 - 15" do
    game.score player1
    game.score player1
    game.score player1
    game.score player2
    expect(game.show_scoreboard).to eq([40,15])
  end

  it "scoreboard, after player1 wins four points and player2 none is 1 game win for player 1" do
    game.score player1
    game.score player1
    game.score player1
    game.score player1
    expect(game.show_scoreboard).to eq(['Winner','Looser'])
  end

  it "needs a difference of two points to win the game" do
    game.score player1
    game.score player1
    game.score player1
    game.score player2
    game.score player2
    game.score player2
    game.score player1
    expect(game.show_scoreboard).to eq(['Advantage',''])
    game.score player2
    expect(game.show_scoreboard).to eq(['Deuce',''])
    game.score player2
    expect(game.show_scoreboard).to eq(['','Advantage'])
    game.score player2
    expect(game.show_scoreboard).to eq(['Looser','Winner'])
  end

end