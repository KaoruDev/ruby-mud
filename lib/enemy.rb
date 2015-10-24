require "lib/utils/character_helpers"

class Enemy
  include Utils::CharacterHelpers

  def take_damage(amount)
    @hp -= amount
  end

  def pick_character
    @character = PickCharacter.for_enemy
  end
end
