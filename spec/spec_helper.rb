$:.unshift File.expand_path(Dir.pwd, '..')
require "pry"

# add Games folder to ruby's load path
Dir["#{File.expand_path(Dir.pwd, '..')}/lib/**/*.rb"].each do |file|
  require_relative file
end

require "spec/helpers/stub_prompter"
require "spec/helpers/enemy_dummy"

RSpec.configure do |c|
  c.include StubPrompter
end

