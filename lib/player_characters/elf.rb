require "lib/utils/character_helpers"
require "lib/utils/action_loader"

module PlayerCharacters
  class Elf
    include ::Utils::CharacterHelpers
    include ::Utils::ActionLoader

    ATTRIBUTE_ADVANTAGES = {
      :hp => 30,
      :mp => 10,
      :agility => 6,
      :dodge => 3
    }

    def self.description
      "#{colors.green("Elves")} are agile and skillful creatures, but lack resistance."
    end

    def attack(character)
      action_klass = Utils::AskQuestions.multiple_choice("#{colors.green("Gaia")} calls you to action!", self, available_actions)
      action_klass.run_against(character)
    end

  end
end
