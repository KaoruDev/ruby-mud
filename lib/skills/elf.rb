module Skills
  module Elf
    def self.description
      "#{color.green("Elves")} are agile and skillful creatures, but lack resistance."
    end

    def self.color
      Utils::Colors
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
