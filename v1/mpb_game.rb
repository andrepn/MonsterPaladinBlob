class Character
  attr_accessor :name, :health, :power
  
  def initialize(name, health, power)
    @name   = name
    @health = health
    @power  = power
  end
  
  def alive
    @health > 0
  end
  
  def to_s
    '#{name}, Health: #{health}, Power: #{power}'
  end
end

class Blob < Character
  attr_accessor :color, :size, :shield, :type, :spell
  BASE_HEALTH      = 5
  BASE_POWER       = 10
  POWER_RAND       = rand(1..5)
  BASE_HEALTH_RAND = rand(1..5)
  COLORS           = ['Red', 'Yellow', 'Blue']
  SIZES            = ['Gigantic', 'Medium', 'Shrimp']

  def initialize(name, health, power, color, size, shield = 2, type = 'Blob', spell = 'Shield')
    super(name, health, power)
    @color  = color
    @size   = size
    @shield = shield
    @type   = type
    @spell  = spell
  end

  def cast
    shield_increase = rand(1..15)
    self.shield += shield_increase
    puts '#{self.name} increased shield by #{shield_increase}'
  end

  def to_s
    super + ', Shield: #{shield}, Color: #{color}, Size: #{size}'
  end

  def self.base_stats
    [BASE_HEALTH, BASE_HEALTH_RAND, BASE_POWER, POWER_RAND]
  end

  def self.attributes
    [COLORS, SIZES]
  end
end

class Paladin < Character
  attr_accessor :kingdom, :style, :type, :spell
  BASE_HEALTH      = 5
  BASE_POWER       = 10
  POWER_RAND       = rand(1..5)
  BASE_HEALTH_RAND = rand(1..5)
  STYLES           = ['Highlander', 'Ninja', 'Centurian']
  KINGDOMS         = ['Socialist', 'Praxeological', 'Industrialist']

  def initialize(name, health, power, kingdom, style, type = 'Paladin', spell = 'Heal')
    super(name, health, power)
    @kingdom = kingdom
    @style   = style
    @type    = type
    @spell   = spell
  end

  def cast
    health_increase = rand(1..15)
    self.health += health_increase
    puts '#{self.name} increased health by #{health_increase}'
  end

  def to_s
    super + ', Kingdom: #{kingdom}, Style: #{style}'
  end

  def self.base_stats
    [BASE_HEALTH, BASE_HEALTH_RAND, BASE_POWER, POWER_RAND]
  end

  def self.attributes
    [STYLES, KINGDOMS]
  end
end

class Monster < Character
  attr_accessor :kind, :build, :rage, :type, :spell
  BASE_HEALTH      = 5
  BASE_POWER       = 10
  POWER_RAND       = rand(1..5)
  BASE_HEALTH_RAND = rand(1..5)
  KINDS            = ['Ogre', 'Goblin', 'Cyclops']
  BUILDS           = ['Beefy', 'Average', 'Mini']

  def initialize(name, health, power, kind, build, type = 'Monster', spell = 'Rage')
    super(name, health, power)
    @kind = kind
    @build = build
    @type = type
    @spell = spell
  end

  def cast
    power_increase = rand(1..20)
    self.power += power_increase
    puts "#{self.name} increased power by #{power_increase}"
  end

  def to_s
    super + ", Kind: #{kind}, Build: #{build}"
  end

  def self.base_stats
    [BASE_HEALTH, BASE_HEALTH_RAND, BASE_POWER, POWER_RAND]
  end

  def self.attributes
    [KINDS, BUILDS]
  end
end

def random_selection(item_list)
  random_int = rand(0...item_list.length)
  item_list[random_int]
end

def create_new_character(random = false)
  main_classes = [Character.descendants]
  char_types   = main_classes.map(:to_s)

  blob_colors, blob_sizes          = Blob.attributes
  paladin_kingdoms, paladin_styles = Paladin.attributes
  monster_kinds, monster_builds    = Monster.attributes

  blob_base_health, blob_health_rand, blob_base_power, blob_power_rand             = Blob.base_stats
  paladin_base_health, paladin_health_rand, paladin_base_power, paladin_power_rand = Paladin.base_stats
  monster_base_health, monster_health_rand, monster_base_power, monster_power_rand = Monster.base_stats

  case random
  when false
    puts 'First choose your character type. You may choose Blob, Paladin, or Monster'
    char_type = gets.chomp
    puts "What is your character's name?"
    char_name = gets.chomp

    char =  case char_type
            when 'blob'
              puts 'What color is your Blob? You may choose Red, Yellow, or Blue'
              blob_color = gets.chomp
              puts 'What size is your Blob? You may choose Gigantic, Medium, or Shrimp'
              blob_size = gets.chomp

              args = [char_name, health(blob_base_health, blob_health_rand), power(blob_base_power, blob_power_rand), blob_color, blob_size]
              generate_random_character(Blob, args)
            when 'paladin'
              puts 'What kingdom is your Paladin from? You may choose Socialist, Praxeological, or Industrialist'
              paladin_kingdom = gets.chomp
              puts "What is your Paladin's style? You may choose Highlander, Ninja, or Centurian"
              paladin_style = gets.chomp

              args = [char_name, health(paladin_base_health, paladin_health_rand), power(paladin_base_power, paladin_power_rand), paladin_kingdom, paladin_style]
              generate_random_character(Paladin, args)
            when 'monster'
              puts "What kind of creature is your Monster? You may choose Ogre, Goblin, or Cyclops"
              monster_kind = gets.chomp
              puts "What is the build of your Monster? You may choose Beefy, Average, or Mini"
              monster_build = gets.chomp

              args = [char_name, health(monster_base_health, monster_health_rand), power(monster_base_power, monster_power_rand), monster_kind, monster_build]
              generate_random_character(Monster, args)
            end

      [char_name, char]
  when true
    char_name = random_char_name

    random_char = case random(char_types)
                  when 'Blob'
                    args = [char_name, health(blob_base_health, blob_health_rand), power(blob_base_power, blob_power_rand), random(blob_colors), random(blob_sizes)]
                    generate_random_character(Blob, args)
                  when 'Paladin'
                    args = [char_name, health(blob_base_health, blob_health_rand), power(paladin_base_power, blob_power_rand), random(paladin_kingdoms), random(paladin_styles)]
                    generate_random_character(Paladin, args)
                  when 'Monster'
                    args = [char_name, health(blob_base_health, blob_health_rand), power(monster_base_power, blob_power_rand), random(monster_kinds), random(monster_builds)]
                    generate_random_character(Monster, args)
                  end

    [char_name, random_char]
  end
end

def generate_random_character(klass, **args)
  klass.new(args)
end

def random_char_name
  ('a'..'z').to_a.shuffle[3, rand(3..8)].join
end

def random(arg)
  arg
end.sample

def health(base_health, rand_health)
  base_health + rand_health
end

def power(base_power, rand_power)
  base_power + rand_power
end

def attack(c1, c2)
  if c2.type == 'Blob'
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