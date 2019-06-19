require_relative 'player.rb'
require_relative 'board.rb'

class Game
    attr_accessor :player1, :player2, :turn, :board
  
    @@winning_positions = [
      [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]
    ]
  
    def initialize
      @player1 = Player.new("bright","X")
      @player2 = Player.new("jolly","O")
      @board = Board.new
  
      @current_turn = 1
      @first_turn = @player1.name
      @winner = ""
  
      # play
    end
  
    def play 
      take_turns
    end
  
    # def allocate_symbols 
    #   @player1.sym = "X"
    #   @player2.sym = "O"
    # end
  
    def take_turns 
      until draw? || @winner != ""
          (@current_turn.even?) ? turn(@player2) : turn(@player1)
      end
      puts "Game was a draw!" if draw? 
    end
  
    def turn(player) 
      puts "Turn #{@current_turn}:"
      puts "---------------------------\n"
      @board.generate_board
      @board.add_symbol(get_valid_position(player), player.sym)
      check_winner(player)
      @current_turn += 1
    end
  
    def get_valid_position(player) 
      input = 0
      until valid_input?(input)
        print "#{player.name}, enter the cell number that you would like to use (1-9): "
        input = gets.chomp.to_i
        print "Invalid input! " unless valid_input?(input)
        puts "Number is not in range 1-9" unless (input > 0 && input < 10)
        puts "Cell taken." if @board.space_taken?(input - 1)
      end
      input - 1
    end
  
    
  
    def draw?(board)
      if board.board_full == true && @winner == ""
        return true
      else
        return false
      end 
    end
  
    def check_winner(player,board) 
      @@winning_positions.each do |array|
        @winner = player.name if array.all? { |a| board.spaces[a] == player.sym }
      end
      if @winner == player.name
        board.generate_board
        # puts "#{player.name} is the winner!"
        return "win"
      end
    end
  
    def valid_input?(input) 
      if input > 0 && input < 10 && @board.space_taken?(input - 1) == false
        return true
      else 
        return false
      end
    end
end

