require "lib/utils/character_helpers"

module PlayerCharacters
  class Elf
    include ::Utils::CharacterHelpers

    ATTRIBUTE_ADVANTAGES = {
      :hp => 300,
      :mp => 100,
      :agility => 6,
      :dodge => 3
    }

    def self.description
      "#{colors.green("Elves")} are agile and skillful creatures, but lack resistance."
    end

  end
end
