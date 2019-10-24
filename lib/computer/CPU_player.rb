module TicTacToe
    class CPUPlayer < Player
        attr_reader :color, :name
        def initialize(input)
            @color = input.fetch(:color)
            @name = "Zarathustra"
        end

        def make_move(game)
            depth = 0
            game.board.grid.each_with_index do |row, row_index|
                row.each_with_index do |cell, cell_index|
                    if game.board.get_cell(row_index, cell_index).value == ""
                        depth += 1
                    end
                end
            end
            return (0..2).to_a.sample, (0..2).to_a.sample if depth == 9

            move = evaluate_branch(game.current_player, game.other_player, depth, game.board)
            puts "Zara should play " + move[1].to_s + ", " + move[2].to_s
            return move[1], move[2]
        end

        def evaluate_branch(player, waiter, depth, board)
            puts "--Depth: " + depth.to_s + "--"
            puts ""
            if player.name == "Zarathustra"
                utility = [-100, -1, -1]
            else
                utility = [100, -1, -1]
            end
            puts "Best: " + utility.inspect

            if board.game_over
                puts "--WINNING CONDITION--"
                if board.game_over == :winner && waiter.name == "Zarathustra"
                    return score = [1, -1, -1]
                elsif board.game_over == :winner && waiter.name != "Zarathustra"
                    return score = [-1, -1, -1]
                else
                    return score = [0, -1, -1]
                end
            end

            puts "Loop through: "
            board.grid.each_with_index do |r, r_index|
                r.each_with_index do |c, c_index|
                    if board.get_cell(r_index, c_index).value == ""
                        puts "(" + r_index.to_s + ", " + c_index.to_s + ")"
                        x, y = r_index, c_index
                        puts "Mark the above cell"
                        puts "eval with: " + waiter.name
                        board.set_cell(x, y, player.color)
                        board.formatted_grid
                        score = evaluate_branch(waiter, player, depth - 1, board)
                        score[1], score[2] = x, y
                        puts "Score: " + score.inspect
                        puts "Erase last move " + x.to_s + ", " + y.to_s
                        board.set_cell(x, y, "")

                        if player.name == "Zarathustra"
                            if score[0] > utility[0]
                                puts "is " + score[0].to_s + " bigger than " + utility[0].to_s + "?"
                                utility = score
                            end
                        else
                            if score[0] < utility[0]
                                puts "is " + score[0].to_s + " smaller than " + utility[0].to_s + "?"
                                utility = score
                            end
                        end
                    end
                end
            end
            puts ""
            puts ""
            puts "UTILITY -> " + utility.inspect
            utility
        end

    end

end