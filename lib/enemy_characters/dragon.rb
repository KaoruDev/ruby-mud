require "lib/utils/character_helpers"

module EnemyCharacters
  class Dragon
    include Utils::CharacterHelpers

    ATTRIBUTE_ADVANTAGES = {
      hp: 20,
      mp: 10
    }
  end
end
