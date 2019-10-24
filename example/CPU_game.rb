require_relative "../lib/tic_tac_toe.rb"

puts "Welcome to tic tac toe"
bob = TicTacToe::Player.new({color: "X", name: "bob"})
zara = TicTacToe::CPUPlayer.new({color: "O"})
players = [bob, zara]
TicTacToe::CPUGame.new(players).play