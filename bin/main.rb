require_relative '../lib/board.rb'
require_relative '../lib/game-logic.rb'
require_relative '../lib/player.rb'

class TicTacToeRunner


    attr_accessor :name1, :name2, :game_data
  
    def initialize
      welcome_screen
      game_loop
    end
  
    def welcome_screen
      puts "Tic-Tac-Toe is a game where two players take turns marking the spaces in a (3 X 3) grid "
      puts "Each player has an option to fill each space with either X or O "
      puts "The player who succeeds in placing three of their marks in a horizontal, vertical, or diagonal row wins the game"
      puts "Let the Games Begin !!!"
      puts "Enter player 1s name:"
      @name1 = gets.chomp
      puts "Enter player 2s name:"
      @name2 = gets.chomp
      puts "#{@name1} is X "
      puts "#{@name2} is O "
    end
  
    def game_loop 
        game_start
        play_again 
        
        
    end
  
    def game_start 
      board = Board.new
      player1, player2 = Player.new(@name1,"X"), Player.new(@name2,"O")
      game = Game.new(player1, player2, board)
    end
  
  
    def play_again 
        loop do
            puts "Would you like to play again? If \"Yes\" enter Y or \"No\" enter N (Y/N)"
            input= gets.chomp.upcase
            if input =="Y" 
                game_start
            elsif input =="N"
                puts"Thanks for playing "
                return false
            end
        end
    end

end
# TicTacToeRunner.new
