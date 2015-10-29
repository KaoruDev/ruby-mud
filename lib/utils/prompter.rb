require "readline"
require "lib/utils/color_alias"

module Utils
  class Prompter
    include Utils::ColorAlias

    def self.run(player: nil, custom_text: nil)
      return player_prompt(player) if player
      output "#{custom_text}:> "
    end

    def self.player_prompt(player)
      output "( #{color.green(player.hp)}HP #{color.yellow(player.mp)}MP ) :: > "
    end

    def self.display_stats(character)
      puts "\n#{character.fancy_name} has (#{color.red(character.hp)}hp) left."
    end

    def self.didnt_get_that
      puts <<-MSG


  #{color.cyan("Sorry I didn't get that.")}
  ===========================


      MSG
    end

    def self.output(text)
      Readline.readline(text)
    end

    def self.display(text="")
      puts text
    end
  end
end

