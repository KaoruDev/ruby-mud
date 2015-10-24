class Enemy
  attr_reader :character

  def hp
    @character.hp
  end

  def mp
    @character.mp
  end

  def pick_character
    @character = PickCharacter.for_enemy.generate_attributes
  end
end
