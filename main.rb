require_relative 'game'

puts "Welcome to the 2-Player Math Game!"

print "Enter Player 1's name: "
player1_name = gets.chomp

print "Enter Player 2's name: "
player2_name = gets.chomp

game = Game.new(player1_name, player2_name)
game.start
