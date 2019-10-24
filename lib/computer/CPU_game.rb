module TicTacToe
    class CPUGame < Game

        def play
            puts "#{current_player.name} has randomly been selected to go first"
            while true
                board.formatted_grid
                puts ""
                if current_player.name == "Zarathustra"
                    puts "Zarathustra is thinking.."
                    x, y = current_player.make_move(self)
                else
                    puts solicit_move
                    x, y = get_move
                end
                board.set_cell(x, y, current_player.color)
                if board.game_over
                    puts game_over_message
                    board.formatted_grid
                    return
                else
                    switch_players
                end
            end
        end
    end
end