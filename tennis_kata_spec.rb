require './tennis_kata'

RSpec.describe "Tennis game" do

  let(:player1) { Player.new }
  let(:player2) { Player.new }
  let(:game) { Tennis_game.new player1, player2 }

  it "starts with two players having 0 points each" do
    expect(game.player1.points).to eq(0)
    expect(game.player2.points).to eq(0)
  end

end