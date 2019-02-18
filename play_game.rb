Dir[File.join(__dir__, 'V1', '*.rb')].each { |file| require file }

begin
  V1::GameEngine.play_game
rescue => e
  puts e
end
