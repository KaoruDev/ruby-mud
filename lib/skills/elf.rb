module Skills
  module Elf
    def self.description
      "#{color.green("Elves")} are agile and skillful creatures, but lack resistance."
    end

    def self.color
      Utils::Colors
    end
  end
end
