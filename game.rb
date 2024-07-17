require 'pry'
require 'pry-byebug'

require 'colorize'

module Game 
    def self.start
    
        puts "Please input name of player 1: "
        name1 = gets.chomp
        player1 = Player.new(name1.colorize(:red))

        puts "Please input name of player 2: "
        name2 = gets.chomp
        player2 = Player.new(name2.colorize(:blue))
        puts "==============================="

        puts "Welcome to Tic-Tac-Toe!"
        chess_board = ChessBoard.new
        chess_board.draw_board

        puts "==============================="

        # binding.pry
        name = player1.name
        current_player = "X"
        until chess_board.game_over? == true do
            puts "Player #{name} please input position:"
            pos = gets.chomp.to_i

            if chess_board.board[pos-1].eql?(pos.to_s)
                color = current_player == "X" ? :red : :blue
                chess_board.board[pos-1] = current_player.colorize(color)
                if current_player.eql?("X")
                    current_player = "O"
                    name = player2.name
                else 
                    current_player = "X"
                    name = player1.name
                end
                chess_board.draw_board
            else
                puts "This slot is taken. Please enter another slot"
            end
        end

        if chess_board.check_win == ("X".colorize(:red) + "X".colorize(:red) + "X".colorize(:red))
            puts "Congratulations! Player #{player1.name} wins!"
        elsif chess_board.check_win == ("O".colorize(:blue) + "O".colorize(:blue) +"O".colorize(:blue))
            puts "Congratulations! Player #{player2.name} wins!"
        else
            puts "It's a tie!"
        end


        puts "Do you want to play new game? (Y/N): "
        want = gets.chomp
        return if want.downcase != "y"  
        start
    end 
end