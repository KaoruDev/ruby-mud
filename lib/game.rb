class Game
  attr_reader :player, :enemy

  def pick_characters
    @player = PickCharacter.for_player
    @player.generate_attributes

    @enemy = PickCharacter.for_enemy
    @enemy.generate_attributes
  end

  def begin_round
    @player.attack(@enemy)
    @enemy.attack(@player)
  end

  private

  def actors
    [@player, @enemy]
  end

end

