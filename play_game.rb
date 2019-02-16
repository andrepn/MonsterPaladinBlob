require_relative 'V1/characters'
require_relative 'V1/helpers'
require_relative 'V1/game_engine'

begin
  V1::GameEngine.play_game
rescue => e
  puts e
end
