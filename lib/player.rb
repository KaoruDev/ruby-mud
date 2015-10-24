class Player
  attr_reader :hp, :mp, :character

  def initialize(configs={})
    @character = configs[:character]
  end

  def take_damage(amount)
    @hp -= amount
  end

  def hp
    @character.hp
  end

  def pick_character
    @character = PickCharacter.for_player
  end
end

