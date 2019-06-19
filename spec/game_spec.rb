require "./lib/game-logic"
require "./lib/board"
require "./lib/player"
require "./bin/main"

RSpec.describe Game do
  let(:board) { Board.new }
  let(:player1) { Player.new("john","X") }
  let(:player2) { Player.new("jane","O") }
  let(:game) { Game.new(player1, player2, board) }
  describe "#valid_input?" do
    it "returns true if you have entered a valid input" do
      allow(board).to receive(:space_taken?){false}
      expect(game.send(:valid_input?,1)).to be true
    end
    # it "returns false if you have entered a valid input" do
    #   player1 = double("Player")
    #   player2 = double("Player")
    #   board = double("Board")
    #   game = Game.new(player1, player2, board)
    #   allow(board).to receive(:space_taken?){false}
    #   expect(game.send(:valid_input?,11)).to be false
    # end
  end

  # describe "#draw?" do
  #   it "returns true if the game is draw" do
  #     player1 = double("Player")
  #     player2 = double("Player")
  #     board = double("Board")
  #     game = Game.new(player1, player2, board)
  #     allow(board).to receive(:board_full){true}
  #     expect(game.send(:draw?)).to be true
  #   end
  #   it "returns false if the game isnt a draw" do
  #     player1 = double("Player")
  #     player2 = double("Player")
  #     board = double("Board")
  #     game = Game.new(player1, player2, board)
  #     allow(board).to receive(:board_full){false}
  #     expect(game.send(:draw?)).to be false
  #   end
  # end

end