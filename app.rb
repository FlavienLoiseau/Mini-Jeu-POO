require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player_1 = Player.new("Josiane")
player_2 = Player.new("José")

def show_all_states (player_1, player_2)
  puts "Voici l'état de chaque joueur :"
  print player_1.show_state
  print player_2.show_state
  puts ""
end

def fight (player_1, player_2)
  puts "Passons à la phase d'attaque :"
  while player_1.life_points > 0 && player_2.life_points > 0
    puts ""
    player_2.attacks(player_1)
    if player_1.life_points <= 0
      break
    end
    player_1.attacks(player_2)
    show_all_states(player_1, player_2)
  end
end

show_all_states(player_1, player_2)
fight(player_1, player_2)