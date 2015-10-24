class Enemy
  attr_reader :character

  def pick_character
    @character = PickCharacter.for_enemy
  end
end
