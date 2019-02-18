require_relative 'characters'

module V1
  module Helpers
    def self.random_selection(item_list)
      random_int = rand(0...item_list.length)
      item_list[random_int]
    end

    def self.create_new_character(random = false)
      main_classes = self.find_descendants
      @char_types  = main_classes.map{|x| x.to_s.delete('V1::')}

      @blob_colors, @blob_sizes          = Blob.attributes
      @paladin_kingdoms, @paladin_styles = Paladin.attributes
      @monster_kinds, @monster_builds    = Monster.attributes

      @blob_base_health, @blob_health_rand, @blob_base_power, @blob_power_rand             = Blob.base_stats
      @paladin_base_health, @paladin_health_rand, @paladin_base_power, @paladin_power_rand = Paladin.base_stats
      @monster_base_health, @monster_health_rand, @monster_base_power, @monster_power_rand = Monster.base_stats

      char_name, random_char = determine_if_random_and_create_characters(random)

      [char_name, random_char]
    end

    def self.determine_if_random_and_create_characters(random)
      @char_name, character = case random
                                when false
                                  @char_type, @char_name = choose_char_type_and_name
                                  character              = choose_and_create_character

                                  [@char_name, character]
                                when true
                                  @char_name   = random_char_name
                                  random_char  = random_characters_choice

                                  [@char_name, random_char]
                                end
      [@char_name, character]
    end

    def self.random_characters_choice
      random_char = case random(@char_types).downcase
                    when 'blob'
                      @args = [ @char_name,
                               health(@blob_base_health, @blob_health_rand),
                               power(@blob_base_power, @blob_power_rand),
                               random(@blob_colors),
                               random(@blob_sizes)
                             ]
                      generate_random_character(Blob)
                    when 'paladin'
                      @args = [
                              @char_name,
                              health(@paladin_base_health, @paladin_health_rand),
                              power(@paladin_base_power, @paladin_power_rand),
                              random(@paladin_kingdoms),
                              random(@paladin_styles)
                             ]
                      generate_random_character(Paladin)
                    when 'monster'
                      @args = [
                               @char_name,
                               health(@monster_base_health, @monster_health_rand),
                               power(@monster_base_power, @monster_power_rand),
                               random(@monster_kinds), random(@monster_builds)
                             ]

                      generate_random_character(Monster)
                    end
      random_char
    end

    def self.choose_char_type_and_name
      puts 'First choose your character type. You may choose Blob, Paladin, or Monster'
      # char_type = gets.chomp
      @char_type = 'Blob'
      puts "What is your character's name?"
      # char_name = gets.chomp
      @char_name = 'Conner'

      [@char_type, @char_name]
    end

    def self.choose_and_create_character
      character = case @char_type.downcase
                  when 'blob'
                    puts 'What color is your Blob? You may choose Red, Yellow, or Blue'
                    # blob_color = gets.chomp
                    blob_color = 'Red'
                    puts 'What size is your Blob? You may choose Gigantic, Medium, or Shrimp'
                    # blob_size = gets.chomp
                    blob_size = 'Medium'

                    @args = [
                             @char_name,
                             health(@blob_base_health, @blob_health_rand),
                             power(@blob_base_power, @blob_power_rand),
                             @blob_color,
                             @blob_size
                            ]
                    generate_random_character(Blob)
                  when 'paladin'
                    puts 'What kingdom is your Paladin from? You may choose Socialist, Praxeological, or Industrialist'
                    paladin_kingdom = gets.chomp
                    puts "What is your Paladin's style? You may choose Highlander, Ninja, or Centurian"
                    paladin_style = gets.chomp

                    @args = [
                              @char_name,
                              health(@paladin_base_health, @paladin_health_rand),
                              power(@paladin_base_power, @paladin_power_rand),
                              @paladin_kingdom,
                              @paladin_style
                             ]
                    generate_random_character(Paladin)
                  when 'monster'
                    puts "What kind of creature is your Monster? You may choose Ogre, Goblin, or Cyclops"
                    monster_kind = gets.chomp
                    puts "What is the build of your Monster? You may choose Beefy, Average, or Mini"
                    monster_build = gets.chomp

                    @args = [
                             @char_name,
                             health(@monster_base_health, @monster_health_rand),
                             power(@monster_base_power, @monster_power_rand),
                             @monster_kind,
                             @monster_build
                            ]
                    generate_random_character(Monster)
                  end
      character
    end

    def self.generate_random_character(klass)
      klass.new(*@args)
    end

    def self.random_char_name
      ('a'..'z').to_a.shuffle[3, rand(3..8)].join
    end

    def self.random(arg)
      arg.sample
    end

    def self.health(base_health, rand_health)
      base_health + rand_health
    end

    def self.power(base_power, rand_power)
      base_power + rand_power
    end

    def self.attack(c1, c2)
      return false                              if is.type_blob?(c2)
      return remove_health(c1, c2)              if is.shield_less_than_zero(c2)
      return adequately_shielded_attack(c1, c2) if is.c2_shield_is_more_than_zero?(c2)
      return adequeate_attack(c1, c2)           if is.c2_shield_more_than_or_equal_to_c1_power(c1, c2)

      is = Struct.new(:c1, :c2) do
        def is.type_blob?(c2)
          c2 == 'Blob'
        end

        def is.shield_less_than_zero(c2)
          c2.shield < 0
        end

        def is.c2_shield_is_more_than_zero?(c2)
          c2.shield > 0
        end

        def is.c2_shield_more_than_or_equal_to_c1_power(c1, c2)
          c2.shield >= c1.power
        end
      end
    end

    def self.remove_health(c1, c2)
      c2.health -= c1.power
    end

    def self.adequeately_attack(c1, c2)
      c2.shield -= c1.power
    end

    def self.adequately_shielded_attack(c1, c2)
      c2.shield = 0
      c2.health -= (c1.power - c2.shield)
    end

    def self.find_descendants
      ObjectSpace.each_object(Class).select { |o| o < Character}.
          tap { |siblings| siblings.reject! { |klass| siblings.any? { |k| klass < k } } }
    end
  end
end