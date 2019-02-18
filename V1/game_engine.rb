module V1
  module GameEngine
    include Helpers

    def self.play_game
      begin
        created_character_hash, @player_character_hash, @enemy_character_hash = create_character_hashes

        puts "Time to create your first character:"
        character_name, character_object       = Helpers.create_new_character
        created_character_hash[character_name] = character_object

        puts created_character_hash

        loop do
          puts "What would you like to do? To create a new character type create, or to battle type battle, or to quit type QUIT"
          # next_action = gets.chomp.downcase
          next_action = 'battle'

          case next_action
          when "create"
            created_character_name, created_character_object = Helpers.create_new_character
            created_character_hash[created_character_name]   = created_character_object
            puts created_character_hash[created_character_name]
          when "battle"
            puts "What character would you like to battle as? Type the name of your character."
            player_1_character = 'Conner'
            puts "Here is your character information: #{created_character_hash[player_1_character]}"
            @player = created_character_hash[player_1_character]

            puts "To battle a random enemy type rando, or to battle a created character type select"
            # enemy_construction = gets.chomp.downcase
            @enemy_construction = 'rando'

            @enemy = enemy_construction_choice

            potential_actions = ["attack", "cast"]
            puts "time to fight!"
            while enemy_and_player_are_alive?
              puts "#{@player.name} will move next"
              puts "to attack your enemy type attack, or to cast your spell type cast"
              move_choice = gets.chomp

              if move_choice == "attack"
                attack(@player, @enemy)
                puts "You hit #{@enemy.name} for #{@player.power} points. #{@enemy.name} has #{@enemy.health} health remaining
            (if your enemy is a blob they might have only lost shield)"

                return puts "Nice you won the fight!" if @enemy.alive!

                puts "Now it's your enemy's turn"
                attack(@enemy, @player)

                puts "Ouch! #{@enemy.name} hit you for #{@enemy.power}. Your health is down to #{@player.health}"
                puts "You lost this one better luck next time" unless @player.alive
              elsif move_choice == "cast"
                puts "Your character is a #{@player.type}; you cast #{@player.spell}"
                @player.cast

                puts "Now it's your enemy's turn"
                attack(@enemy, @player)
                puts "Ouch! #{@enemy.name} hit you for #{@enemy.power}. Your health is down to #{@player.health}"

                #player dead message then restart loop
                unless @player.alive
                  puts "You lost this one better luck next time"
                end
              end
            end
          when "QUIT"
            abort("Thanks for playing!")
          else
            puts "That's not an option, you can 'create', 'battle', or 'QUIT'"
          end
        end
      rescue => e
        puts "sorry we have an error to put out! Please report this error to Andrew: #{e}"
      end
    end

    def self.create_character_hashes
      [{},{},{}]
    end

    def self.enemy_construction_choice
      enemy = case @enemy_construction
              when "select"
                puts "Which character would you like to fight against? Type the name of the character."
                enemy_created_character = gets.chomp
                puts "Your enemy is a #{created_character_hash[enemy_created_character].type} with the following stats:
                           #{created_character_hash[enemy_created_character]}"
                created_character_hash[enemy_created_character]
              when "rando"
                random_char_name, random_char = Helpers.create_new_character(random = true)
                @enemy_character_hash[random_char_name] = random_char
                puts "Your enemy is a #{random_char.type} with the following stats: #{@enemy_character_hash[random_char_name]}"
                @enemy_character_hash[random_char_name]
              end
      enemy
    end

    def self.enemy_and_player_are_alive?
      @enemy.alive? && @player.alive?
    end
  end
end