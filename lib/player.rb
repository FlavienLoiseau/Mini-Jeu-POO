class Player
  attr_accessor :name, :life_points

  def initialize(name, life_points=10)
    @name = name
    @life_points = life_points
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie"
  end

  def gets_damage(damages_endured)
    @life_points -= damages_endured

    if @life_points <= 0
      puts "Le joueur #{@name} a été tué"
    end
  end

  def attacks(player_attacked)
    puts "Le joueur #{@name} attaque le joueur #{player_attacked.name}"
    attack = compute_damage
    puts "Il lui inflige #{attack} points de dommages"
    player_attacked.gets_damage(attack)
  end

  def compute_damage
    return rand(1..6)
  end

end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name, life_points=100, weapon_level = 1)
    @weapon_level = weapon_level
    super(name, life_points)
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{weapon_level}"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    new_weapon_level = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon_level}"
    if new_weapon_level > @weapon_level
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
      @weapon_level = new_weapon_level
    else
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def search_health_pack
    health_pack = rand(1..6)
    if health_pack == 1
      puts "Tu n'as rien trouvé..."
    elsif health_pack == 6
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
      @life_points += 80
    else
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
      @life_points += 80
    end
    if @life_points > 100
      @life_points = 100
    end
  end

end