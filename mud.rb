$:.unshift File.dirname(__FILE__)

# add Games folder to ruby's load path
Dir["#{File.dirname(__FILE__)}/lib/**/*.rb"].each do |file|
  require_relative file
end

game = Game.new
game.pick_characters
game.begin_round

