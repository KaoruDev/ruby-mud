require "lib/utils/character_helpers"

module EnemyCharacters
  class Orc
    include Utils::CharacterHelpers

    ATTRIBUTE_ADVANTAGES = {
      hp: 30,
      mp: 5
    }

    def fancy_name
      "#{color.red("Orc")} Warrior"
    end
  end
end
