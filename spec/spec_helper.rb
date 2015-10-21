$:.unshift File.expand_path(Dir.pwd, '..')
require "fabrication"
require "spec/helpers/stub_prompter"
require "pry"

# add Games folder to ruby's load path
Dir["#{File.expand_path(Dir.pwd, '..')}/lib/**/*.rb"].each do |file|
  require_relative file
end

RSpec.configure do |c|
  c.include StubPrompter
end

