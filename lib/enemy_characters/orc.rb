require "lib/utils/character_helpers"

module EnemyCharacters
  class Orc
    include Utils::CharacterHelpers

    ATTRIBUTE_ADVANTAGES = {
      hp: 30,
      mp: 5
    }
  end
end
