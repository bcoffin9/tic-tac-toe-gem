require "spec_helper"

module TicTacToe
    RSpec.describe CPUGame do

        let (:bob) { Player.new({color: "X", name: "bob"}) }
        let (:zara) { Player.new({color: "O", name: "Zarathustra"}) }
        context "#solicit_move" do
            it "shows Z thinking when he is up" do
                game = CPUGame.new([bob, zara])
                allow(game).to receive(:current_player) { zara }
                expected = "Zarathustra is making a move"
                expect(game.solicit_move).to eq expected
            end
        end
    end
end