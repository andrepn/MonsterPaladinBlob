require_relative 'v1/characters.rb'

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