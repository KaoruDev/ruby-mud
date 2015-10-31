require "lib/utils/character_helpers"
require "lib/utils/action_loader"

module EnemyCharacters
  class Dragon
    include Utils::CharacterHelpers
    include Utils::ActionLoader

    ATTRIBUTE_ADVANTAGES = {
      hp: 25,
      mp: 10
    }

    def fancy_name
      "Huge #{color.red("Dragon")}"
    end

    def attack(target)
      available_actions(with_descriptions: false).values.sample.run_against(target: target, me: self)
    end

  end
end
