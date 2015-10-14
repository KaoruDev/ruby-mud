require "readline"

class Prompter

  def self.run(player=nil)
    return player_prompt(player) if player
    output(":> ")
  end

  def self.player_prompt(player)
    output("( #{Utils::Colors.green(player.hp)}HP #{Utils::Colors.yellow(player.mp)}MP ) :: > ")
  end

  def self.enemy_stats(enemy)
    puts "\n#{enemy.fancy_name} has (#{Utils::Colors.red(enemy.hp)}hp) left."
  end

  def self.didnt_get_that
    puts <<-MSG


#{Utils::Colors.cyan("Sorry I didn't get that.")}
===========================


    MSG
  end

  def self.output(text)
    Readline.readline(text)
  end

end


