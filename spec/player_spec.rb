require "./lib/player"

RSpec.describe Player do
    describe "#initialize" do
        player = Player.new("Michael","X")

        it "initializes a player with the name passed as an argument" do
            expect(player.name).to eql("Michael")
        end
        it "initializes a player with the sym passed as an argument" do
            expect(player.sym).to eql("X")
        end
    end
end