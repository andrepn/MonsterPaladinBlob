=begin
This is a game with three classes that can engage
in battles
=end

#Classes:
#define character superclass
class Character
  attr_accessor :name, :health, :power
  def initialize(name, health, power)
    @name = name
    @health = health
    @power = power
  end
  def Alive
    @health > 0
  end
  def to_s
    "#{name}, Health: #{health}, Power: #{power}"
  end
end

#define Blob class
class Blob < Character
  attr_accessor :color, :size, :shield, :type, :spell
  def initialize(name, health, power, color, size, shield = 2, type = "Blob", spell = "Shield")
    super(name, health, power)
    @color = color
    @size = size
    @shield = shield
    @type = type
    @spell = spell
  end
  def cast()
    shield_increase = rand(1..15)
    self.shield += shield_increase
    puts "#{self.name} increased shield by #{shield_increase}"
  end
  def to_s
    super + ", Shield: #{shield}, Color: #{color}, Size: #{size}"
  end
end

#define Paladin Class
class Paladin < Character
  attr_accessor :kingdom, :style, :type, :spell
  def initialize(name, health, power, kingdom, style, type = "Paladin", spell = "Heal")
    super(name, health, power)
    @kingdom = kingdom
    @style = style
    @type = type
    @spell = spell
  end
  def cast()
    health_increase = rand(1..15)
    self.health += health_increase
    puts "#{self.name} increased health by #{health_increase}"
  end
  def to_s
    super + ", Kingdom: #{kingdom}, Style: #{style}"
  end
end

#define Monster Class
class Monster < Character
  attr_accessor :kind, :build, :rage, :type, :spell
  def initialize(name, health, power, kind, build, type = "Monster", spell = "Rage")
    super(name, health, power)
    @kind = kind
    @build = build
    @type = type
    @spell = spell
  end
  def cast()
    power_increase = rand(1..20)
    self.power += power_increase
    puts "#{self.name} increased power by #{power_increase}"
  end
  def to_s
    super + ", Kind: #{kind}, Build: #{build}"
  end
end


#define function for random attribute selection
def random_selection(item_list)
  random_int = rand(0...item_list.length)
  return item_list[random_int]
end


#define create new character loop
def create_new_character(random = false)

  #List arrays of types and attributes
  char_types = ["Blob", "Paladin", "Monster"]

  #blob attributes`
  blob_colors = ["Red", "Yellow", "Blue"]
  blob_sizes = ["Gigantic", "Medium", "Shrimp"]

  #paladin attributes
  paladin_kingdoms = ["Socialist", "Praxeological", "Industrialist"]
  paladin_styles = ["Highlander", "Ninja", "Centurian"]

  #monster attributes
  monster_kinds = ["Ogre", "Goblin", "Cyclops"]
  monster_builds = ["Beefy", "Average", "Mini"]

  #define base stats by class
  #base stats Blob
  blob_base_health = 10
  blob_health_rand = rand(1..5)
  blob_base_power = 5
  blob_power_rand = rand(1..5)

  #base stats Paladin
  paladin_base_health = 5
  paladin_health_rand = rand(1..5)
  paladin_base_power = 10
  paladin_power_rand = rand(1..5)

  #base stats Monster
  monster_base_health = 7
  monster_health_rand = rand(1..8)
  monster_base_power = 8
  monster_power_rand = rand(1..7)

  #generate character with user input
  case random
  when false
    #start create character loop
    puts "First choose your character type. You may choose Blob, Paladin, or Monster"
    char_type = gets.chomp
    puts "What is your character's name?"
    char_name, char = gets.chomp

      case char_type
      when "Blob"
        puts "What color is your Blob? You may choose Red, Yellow, or Blue"
        blob_color = gets.chomp
        puts "What size is your Blob? You may choose Gigantic, Medium, or Shrimp"
        blob_size = gets.chomp
        char = Blob.new(@name = char_name, @health = blob_base_health + blob_health_rand, @power = blob_base_power + blob_power_rand,
          @color = blob_color, @size = blob_size)

      when "Paladin"
        puts "What kingdom is your Paladin from? You may choose Socialist, Praxeological, or Industrialist"
        paladin_kingdom = gets.chomp
        puts "What is your Paladin's style? You may choose Highlander, Ninja, or Centurian"
        paladin_style = gets.chomp
        char = Paladin.new(@name = char_name, @health = paladin_base_health + paladin_health_rand, @power = paladin_base_power + paladin_power_rand,
          @kingdom = paladin_kingdom, @style = paladin_style)

      when "Monster"
        puts "What kind of creature is your Monster? You may choose Ogre, Goblin, or Cyclops"
        monster_kind = gets.chomp
        puts "What is the build of your Monster? You may choose Beefy, Average, or Mini"
        monster_build = gets.chomp
        char = Monster.new(@name = char_name, @health = monster_base_health + monster_health_rand, @power = monster_base_power + monster_power_rand,
          @kind = monster_kind, @build = monster_build)
      end

      #return char name and char object
      return char_name, char
  #generate random character
  when true

    #random type
    random_char_type =  char_types.sample

    #random name lol
    random_int = rand(3..8)
    random_char_name = ("a".."z").to_a.shuffle[3, random_int].join

    #generate random Blob
    case random_char_type
    when "Blob"

      #choose random color
      random_blob_color = blob_colors.sample

      #choose random size
      random_blob_size = blob_sizes.sample

      #generate random blob
      random_char = Blob.new(@name = random_char_name, @health = blob_base_health + blob_health_rand, @power = blob_base_power + blob_power_rand,
        @color = random_blob_color, @size = random_blob_size)

    #random Paladin
    when "Paladin"

      #choose random kingdom
      random_paladin_kingdom = paladin_kingdoms.sample

      #choose random style
      random_paladin_style = paladin_styles.sample

      #generate random Paladin
      random_char = Paladin.new(@name = random_char_name, @health = paladin_base_health + paladin_health_rand, @power = paladin_base_power + paladin_power_rand,
        @kingdom = random_paladin_kingdom, @style = random_paladin_style)

    #random Monster
    when "Monster"

      #choose random kind`
      random_monster_kind = monster_kinds.sample

      #choose random build
      random_monster_build = monster_builds.sample

      #generate random Monster
      random_char = Monster.new(@name = random_char_name, @health = monster_base_health + monster_health_rand, @power = monster_base_power + monster_power_rand,
        @kind = random_monster_kind, @build = random_monster_build)
    end

    #return name and char object
    return random_char_name, random_char
  end
end

#define actions
def attack(c1, c2)
  if c2.type == "Blob"
    if c2.shield > 0
      if c2.shield >= c1.power
        c2.shield -= c1.power
      else
        c2.shield = 0
        c2.health -= (c1.power - c2.shield)
      end
    else
      c2.health -= c1.power
    end
  else
    c2.health -= c1.power
  end
end

begin
  #character hashes (future team battles?)
  created_character_hash = {}
  player_character_hash = {}
  enemy_character_hash = {}

  #create and store first human character
  puts "Time to create your first character:"
  character_name, character_object = create_new_character()
  created_character_hash[character_name] = character_object
  puts created_character_hash[character_name]

  #let user decide what to do next
  next_action = ""
  loop do
    #COULD ADD SAVE AND LOAD FEATURES FOR CHARACTERS, COULD ADD TEAMFIGHTS
    puts "What would you like to do? To create a new character type create, or to battle type battle, or to quit type QUIT"
    next_action = gets.chomp

    #another create character
    case next_action
    when "create"
      created_character_name, created_character_object = create_new_character()
      created_character_hash[created_character_name] = created_character_object
      puts created_character_hash[created_character_name]

    #battle loop
    when "battle"

      #select player character
      puts "What character would you like to battle as? Type the name of your character."
      player_1_character = gets.chomp
      puts "Here is your character information: #{created_character_hash[player_1_character]}"
      player = created_character_hash[player_1_character]

      #select choose or generate enemy
      puts "To battle a random enemy type rando, or to battle a created character type select"
      enemy_construction = gets.chomp

      #select created character for enemy
      case enemy_construction
      when "select"
        puts "Which character would you like to fight against? Type the name of the character."
        enemy_created_character = gets.chomp
        puts "Your enemy is a #{created_character_hash[enemy_created_character].type} with the following stats:
         #{created_character_hash[enemy_created_character]}"
        enemy = created_character_hash[enemy_created_character]

      #generate random enemy
      when "rando"
        random_char_name, random_char = create_new_character(random = true)
        enemy_character_hash[random_char_name] = random_char
        puts "Your enemy is a #{random_char.type} with the following stats: #{enemy_character_hash[random_char_name]}"
        enemy = enemy_character_hash[random_char_name]
      end


      potential_actions = ["attack", "cast"]
      #fight
      puts "time to fight"
      while player.Alive && enemy.Alive
        puts "#{player.name} will move next"
        puts "to attack your enemy type attack, or to cast your spell type cast"
        move_choice = gets.chomp

        if move_choice == "attack"
          attack(player, enemy)
          puts "You hit #{enemy.name} for #{player.power} points. #{enemy.name} has #{enemy.health} health remaining
            (if your enemy is a blob they might have only lost shield)"

          #enemy turn if alive
          if enemy.Alive
            puts "Now it's your enemy's turn"
            attack(enemy, player)
            puts "Ouch! #{enemy.name} hit you for #{enemy.power}. Your health is down to #{player.health}"

            #player dead message then restart loop
            unless player.Alive
              puts "You lost this one better luck next time"

          #enemy dead message then restart loop
          else
            puts "Nice you won the fight!"
            #ADD IN SAVE AND CONTINUE AND LEVEL UP
          end

        #all casts are self cast so enemy cannot die
        elsif move_choice == "cast"
          puts "Your character is a #{player.type}; you cast #{player.spell}"
          player.cast

          puts "Now it's your enemy's turn"
          attack(enemy, player)
          puts "Ouch! #{enemy.name} hit you for #{enemy.power}. Your health is down to #{player.health}"

          #player dead message then restart loop
          unless player.Alive
            puts "You lost this one better luck next time"
        end
      end
    when "QUIT"
      abort("Thanks for playing!")
    end
  end
end
