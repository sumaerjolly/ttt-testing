require "./lib/board"

RSpec.describe Board do
    let (:board){Board.new}
    describe "#initialize" do
        it "initializes a board with an array spaces with the numbers 1-9" do
            expect(board.spaces).to eql([1,2,3,4,5,6,7,8,9])
        end
    end

    describe "#add_symbol" do
        it " it adds the symbol to the board " do
            board.add_symbol(0,"X")
            expect(board.spaces[0]).to eql("X")
        end
    end

    describe "#space_taken?" do
        it "returns true or false is the space choosen is taken" do
            board.spaces = [1,2,3,4,5,"X",7,8,9]
            expect(board.space_taken?(5)).to eql(true)
        end
    end

    describe "board_full" do
        it "returns true if all positions are taken" do
            board.spaces = ["X","O","O","X","X","O","X","O","X"]
            expect(board.board_full).to eql(true)
        end
    end

end

