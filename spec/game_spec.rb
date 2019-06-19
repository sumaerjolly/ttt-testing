require './lib/board.rb'
require './lib/game-logic.rb'
require './lib/player.rb'
require './bin/main.rb'

describe Game do
    let(:player1){Player.new("bright","X")}
    let(:player2){Player.new("jolly","O")}
    let(:game){Game.new}
    let(:board){Board.new}
    
  
    
  describe "#valid_input?" do
      context 'when the input entered is acceptable' do
          
          it 'checks with the input entered is valid' do
              expect(game.valid_input?(2)).to eql(true)
          end
          it 'checks with the input entered is valid' do
            expect(game.valid_input?(20)).to eql(false)
        end
      end
  end

  describe "#draw?" do
      context 'when its a draw' do
          before do
              allow(board).to receive(:board_full).and_return(true) 
          end
          it 'checks whether the game ends in a draw' do
              expect(game.draw?(board)).to eql(true)
          end
      end
  end


  describe "#check_winner" do
    context 'it checks if there is a winner horizontally' do
        before do
            allow(board).to receive(:spaces).and_return(["X","X","X",1,2,3,4,5,6]) 
        end
        it 'checks whether the game has a winner horizontally' do
            expect(game.check_winner(player1,board)).to eql("win")
        end
    end
  end

  describe "#check_winner" do
    context 'it checks if there is a winner vertially' do
        before do
            allow(board).to receive(:spaces).and_return(["X",2,3,"X",5,6,"X",8,9]) 
        end
        it 'checks whether the game has a winner vertically' do
            expect(game.check_winner(player1,board)).to eql("win")
        end
    end
  end

  describe "#check_winner" do
    context 'it checks if there is a winner diagonally' do
        before do
            allow(board).to receive(:spaces).and_return(["X",2,3,4,"X",6,7,8,"X"]) 
        end
        it 'checks whether the game has a winner diagonally' do
            expect(game.check_winner(player1,board)).to eql("win")
        end
    end
  end

end