module TicTacToe
    class CPUGame < Game
        def solicit_move
            "#{current_player.name}: Enter a number between 1 and 9 to make your move" if @current_player.name != "Zarathustra"
            "Zarathustra is making a move" if @current_player.name == "Zarathustra"
        end

        def get_move
            #get all empty positions
            #for each empty spot, make a branch
            #after each branch, see if that move is "the best"
            #return the best
        end
    end
end