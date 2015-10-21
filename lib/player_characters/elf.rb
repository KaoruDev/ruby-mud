require "lib/utils/character_helpers"

module PlayerCharacters
  class Elf
    include ::Utils::CharacterHelpers

    def self.description
      "#{colors.green("Elves")} are agile and skillful creatures, but lack resistance."
    end

    def attribute_advantages
      {
        :hp => 300,
        :mp => 100,
        :agility => 6,
        :dodge => 3
      }
    end
  end
end
