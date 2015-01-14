require './tennis_kata'

RSpec.describe "Tennis game" do

  let(:packages_selector) {packages_selector = Packages_selector.new(Books_list_operations.new)}

  it "starts with two players having 0 points each" do
    player1 = Player.new
    player2 = Player.new
    game = Tennis_game.new player1, player2
    expect(player1.points).to eq(0)
    #expect(game.@player2.@points).to eq(0) 
  end

end