require './Game'
require './player'

one = Player.new(1)
two = Player.new(2)

play = Game.new(one, two)
play.play_game
