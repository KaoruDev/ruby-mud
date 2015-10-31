class Game
  attr_reader :player, :enemy

  def pick_characters
    @player = PickCharacter.for_player
    @player.generate_attributes

    @enemy = PickCharacter.for_enemy
    @enemy.generate_attributes
  end

  def begin_round
    while both_actors_are_alive?
      Utils::Prompter.display_stats(@enemy)
      @player.attack(@enemy)
      @enemy.attack(@player)
    end
  end

  def both_actors_are_alive?
    @player.hp > 0 && @enemy.hp > 0
  end

  private

  def actors
    [@player, @enemy]
  end

end

