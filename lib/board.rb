class Board
    attr_accessor :spaces

    def initialize
      @spaces = [1,2,3,4,5,6,7,8,9]
    end

    def generate_board 
        puts "  #{@spaces[0]} | #{@spaces[1]} | #{@spaces[2]}"
        puts " ---|---|---"
        puts "  #{@spaces[3]} | #{@spaces[4]} | #{@spaces[5]}"
        puts " ---|---|---"
        puts "  #{@spaces[6]} | #{@spaces[7]} | #{@spaces[8]}"
        puts ""
    end

    def add_symbol(position, symbol) 
      @spaces[position] = symbol
    end

    def space_taken?(position) 
      return @spaces[position] == "X" || @spaces[position] == "O"
    end

    def board_full
      @spaces.all? { |x|
        x.is_a? String 
      }
    end
end
