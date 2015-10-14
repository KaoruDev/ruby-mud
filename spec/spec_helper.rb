$:.unshift File.expand_path(Dir.pwd, '..')
require("fabrication")

# add Games folder to ruby's load path
Dir["#{File.expand_path(Dir.pwd, '..')}/lib/**/*.rb"].each do |file|
  require_relative file
end
