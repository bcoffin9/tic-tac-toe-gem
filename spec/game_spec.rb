module TicTacToe
    RSpec.describe Game do
        
        let (:bob) { Player.new({color: "X", name: "bob"}) }
        let (:frank) { Player.new({color: "O", name: "frank"}) }

        context "#initialize" do
            it "randomly selects a current_player" do
                players = [bob, frank]
                allow(players).to receive(:shuffle) { [frank, bob] }
                game = Game.new(players)
                expect(game.current_player).to eq frank
            end

            it "randomly selects an other_player" do
                players = [bob, frank]
                allow(players).to receive(:shuffle) { [frank, bob] }
                game = Game.new(players)
                expect(game.other_player).to eq bob
            end
        end

        context "#switch_players" do
            it "will set @current_player to @other_player" do
                game = Game.new([bob, frank])
                other_player = game.other_player
                game.switch_players
                expect(game.current_player).to eq other_player
            end

            it "and vice versa" do
                game = Game.new([bob, frank])
                current_player = game.current_player
                game.switch_players
                expect(game.other_player).to eq current_player
            end
        end

        context "#solicit_move" do
            it "asks the player to make a move" do
                game = Game.new([bob, frank])
                allow(game).to receive(:current_player) { bob }
                expected = "bob: Enter a number between 1 and 9 to make your move"
                expect(game.solicit_move).to eq expected
            end
        end

        context "#get_move" do
            it "converts human_move of '1' to [0, 0]" do
                game = Game.new([bob, frank])
                expect(game.get_move("1")).to eq [0, 0]
            end
        end

        context "#game_over_message" do
            it "returns '{current_player} won!' if board shows a winner" do
                game = Game.new([bob, frank])
                allow(game).to receive(:current_player) { bob }
                allow(game.board).to receive(:game_over) { :winner }
                expect(game.game_over_message).to eq "bob won!"
            end

            it "returns 'The game ended in a tie' if board shows a draw" do
                game = Game.new([bob, frank])
                allow(game.board).to receive(:game_over) { :draw }
                expect(game.game_over_message).to eq "The game ended in a tie"
            end
        end
    end
end