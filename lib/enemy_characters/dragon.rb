require "lib/utils/character_helpers"
require "lib/utils/action_loader"

module EnemyCharacters
  class Dragon
    include Utils::CharacterHelpers
    include Utils::ActionLoader

    ATTRIBUTE_ADVANTAGES = {
      hp: 25,
      mp: 10,
      min_attack: 2,
      max_attack: 4,
    }

    def fancy_name
      "Huge #{color.red("Dragon")}"
    end

    def attack(target)
      available_actions(with_descriptions: false).values.sample.run_against(target: target, me: self, action_multiplier: attack_range)
    end

  end
end
