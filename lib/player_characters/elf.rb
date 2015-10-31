require "lib/utils/character_helpers"
require "lib/utils/action_loader"

module PlayerCharacters
  class Elf
    include ::Utils::CharacterHelpers
    include ::Utils::ActionLoader

    ATTRIBUTE_ADVANTAGES = {
      :hp => 18,
      :mp => 10,
      :min_attack => 3,
      :max_attack => 5
    }

    def self.description
      "#{color.green("Elves")} are agile and skillful creatures, but lack resistance."
    end

    def attack(character)
      action_klass = Utils::AskQuestions.multiple_choice(attack_question, self, available_actions)
      Utils::Prompter.display("\n")
      action_klass.run_against(target: character, me: self, action_multiplier: attack_range)
    end

    private

    def attack_question
<<-MSG
==========================================

#{color.green("Gaia")} calls you to action!
MSG
    end


  end
end
