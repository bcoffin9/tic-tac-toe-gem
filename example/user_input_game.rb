require_relative "../lib/tic_tac_toe.rb"

puts "Welcome to Tic Tac Toe, we've been expecting you"
puts "The board has the following structure:"
puts "1 4 7"
puts "2 5 8"
puts "3 6 9"

puts "Player 1, enter your name:"
player1 = TicTacToe::Player.new({ color: "X", name: gets.chomp})
puts "Player 2, enter your name:"
player2 = TicTacToe::Player.new({ color: "O", name: gets.chomp})
TicTacToe::Game.new([player1, player2]).play
