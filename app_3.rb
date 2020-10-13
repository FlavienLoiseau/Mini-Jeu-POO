require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------"

puts "
Initialisation du joueur :
Pour commencer, comment t'appelles-tu ?"
print "> "
name = gets.chomp

my_game = Game.new(name)

def perform (my_game)
  while my_game.is_still_ongoing
    my_game.show_players
    my_game.menu
    choice = gets.chomp.to_s
    puts "__________________"
    my_game.menu_choice(choice)
    my_game.enemies_attack
  end
  my_game.end
end

perform(my_game)