require "spec_helper"

module TicTacToe
    RSpec.describe Player do
        context "#initialize" do
            it "raises an exception when initialized with {}" do
                expect { Player.new({}) }.to raise_error
            end
            it "does not raise an exception when initialized with a proper value" do
                input = { color: "X", name: "Someone"}
                expect {Player.new(input)}.to_not raise_error
            end
        end
        context "#color" do
            it "returns the color" do
                input = { color: "X", name: "Someone"}
                player = Player.new(input)
                expect(player.color).to eq "X"
            end
        end
        context "#name" do
            it "returns the name" do
                input = { color: "O", name:"Dwight"}
                player = Player.new(input)
                expect(player.name).to eq "Dwight"
            end
        end
    end
end