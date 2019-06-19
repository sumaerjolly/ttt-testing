require_relative 'player.rb'
require_relative 'board.rb'

class Game
    attr_accessor :player1, :player2, :turn, :board
  
    @@winning_positions = [
      [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]
    ]
  
    def initialize(player1, player2, board)
      @player1 = player1
      @player2 = player2
      @board = board
  
      @current_turn = 1
      @first_turn = @player1
      @winner = ""
  
      take_turns
    end

    def take_turns 
      until draw? || @winner != ""
          (@current_turn.even?) ? turn(@player2) : turn(@player1)
      end
      puts "\n"
      @board.generate_board
      puts "Game was a draw!" if draw? 
    end
  
    def turn(player) 
      puts "Turn #{@current_turn}:"
      puts "---------------------------\n"
      @board.generate_board
      @board.add_symbol(get_valid_position(player), player.sym)
      check_winner(player)
      display_winner(player)
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
  
    
  
    def draw? 
      (@board.board_full == true) && (@winner == "")
    end
  
    def check_winner(player) 
      @@winning_positions.each do |array|
        @winner = player.name if array.all? { |a| @board.spaces[a] == player.sym }
      end
    end

    def display_winner(player)
      if @winner == player.name
        puts "\n"
        @board.generate_board
        puts "#{player.name} is the winner!"
      end
    end
  
    def valid_input?(input) 
      return input > 0 && input < 10 && !@board.space_taken?(input - 1)
    end
end

