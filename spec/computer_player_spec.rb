require "spec_helper"

module TicTacToe

    RSpec.describe CPUPlayer do

        context "#initialize" do
            it "raises an exception when initialized with {}" do
                expect { CPUPlayer.new({}) }.to raise_error
            end
            it "does not raise an exception when initialized with a proper value" do
                input = { color: "X" }
                expect {CPUPlayer.new(input)}.to_not raise_error
            end
        end
        context "#color" do
            it "returns the color" do
                input = { color: "X" }
                player = CPUPlayer.new(input)
                expect(player.color).to eq "X"
            end
        end
        context "#name" do
            it "returns the name" do
                input = { color: "O" }
                player = CPUPlayer.new(input)
                expect(player.name).to eq "Zarathustra"
            end
        end
    end
end
