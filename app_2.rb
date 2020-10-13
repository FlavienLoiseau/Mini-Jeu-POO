require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------"

def player_init
  puts "
  Initialisation du joueur :
  Pour commencer, comment t'appelles-tu ?"
  print "> "
  name = gets.chomp
  human_player = HumanPlayer.new(name)
  return human_player
end

def enemies_init
  enemies = []
  enemies << Player.new("Josiane")
  enemies << Player.new("José")
  return enemies
end

def fight (player_init, enemies_init)

  while player_init.life_points >0 && (enemies_init[0].life_points > 0 || enemies_init[1].life_points >0)
    puts ""
    puts player_init.show_state
    puts "Quelle action veux-tu effectuer ?"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts "attaquer un joueur en vue :"
    if enemies_init[0].life_points <= 0
      puts "0 - #{enemies_init[0].name} est mort"
    else
      print "0 - "
      enemies_init[0].show_state
    end
    if enemies_init[1].life_points <= 0
      puts "1 - #{enemies_init[1].name} est mort"
    else
      print "1 - "
      enemies_init[1].show_state
    end
    print "> "
    choix = gets.chomp
    puts ""
    
    case choix
    when "a"
      player_init.search_weapon
    when "s"
      player_init.search_health_pack
    when "0"
      player_init.attacks(enemies_init[0])
    when "1"
      player_init.attacks(enemies_init[1])
    else
      puts "Dommage, tu viens de donner un coup dans l'eau"
    end

    puts ""
    puts "Les autres joueurs t'attaquent !"
    enemies_init.each do |enemie|
      if enemie.life_points > 0
        enemie.attacks(player_init)
      end
    end
  end

  puts "La partie est finie"
  if player_init.life_points > 0
    puts "BRAVO ! TU AS GAGNE !"
  else
    puts "Loser ! Tu as perdu !"
  end

end

fight(player_init,enemies_init)