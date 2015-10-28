require "lib/utils/character_helpers"
require "lib/utils/action_loader"

module EnemyCharacters
  class Dragon
    include Utils::CharacterHelpers
    include Utils::ActionLoader

    ATTRIBUTE_ADVANTAGES = {
      hp: 20,
      mp: 10
    }

    def fancy_name
      "Huge #{colors.red("Dragon")}"
    end

    def attack(target)
      available_actions(with_descriptions: false).values.sample.run_against(target, self)
    end

  end
end
