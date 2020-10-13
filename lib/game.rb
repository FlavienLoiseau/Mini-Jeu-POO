class Game
  attr_accessor :human_player, :enemies

  def initialize(human_name, number_of_enemies = 4)
    @human_player = human_player
    @enemies = enemies

    # initialisation des enemies
    @enemies = []
    number_of_enemies.times do |i = 1|
      @enemies << Player.new("Player_#{i}")
    end

    # initialisation du joueur humain
    @human_player = HumanPlayer.new(human_name)    
  end

  def kill_player (player)
    @enemies.delete(player)
  end

  def is_still_ongoing
    if @human_player.life_points > 0 && @enemies.length > 0
      return true
    else
      return false
    end
  end

  def show_players
    puts ""
    print @human_player.show_state
    puts "Il reste #{@enemies.length} bots en vie"
    sleep (2)
  end

  def menu
    puts ""
    puts "Quelle action veux-tu effectuer ?"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts ""
    puts "attaquer un joueur en vue :"
    i = 0
    @enemies.each do |enemie|
      print "#{i} - "
      print enemie.show_state
      i += 1
    end
    print "> "
  end

  def menu_choice (choice)
    case choice
    when "a"
      @human_player.search_weapon
    when "s"
      @human_player.search_health_pack
    else
      @human_player.attacks(@enemies[choice.to_i])
      if @enemies[choice.to_i].life_points <= 0
        kill_player(@enemies[choice.to_i])
      end
    end
    sleep (3)
  end

  def enemies_attack
    if @enemies.length > 0
      puts ""
      puts "Les autres joueurs t'attaquent !"
      @enemies.each do |enemie|
        sleep (1)
        enemie.attacks(@human_player)
      end
    end
  end

  def end
    puts ""
    puts "==================="
    puts "La partie est finie"
    if @human_player.life_points > 0
      puts "BRAVO ! TU AS GAGNE !"
    else
      puts "Loser ! Tu as perdu !"
    end
  end

end