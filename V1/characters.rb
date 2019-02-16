module V1
  class Character
    attr_accessor :name, :health, :power, :alive

    def initialize(name, health, power)
      @name   = name
      @health = health
      @power  = power
    end

    def alive?
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

    def self.cast
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
end