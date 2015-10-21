class PickCharacter
  def self.for_player
    Utils::AskQuestions.multiple_choice("Who would you like to be?", nil, possible_player_characters)
  end

  def self.for_enemy
  end

  private

  def self.possible_player_characters
    result = {}

    Dir.glob("lib/player_characters/*.rb") do |filename|
      md = filename.match(/lib\/player\_characters\/(\S+)\.rb/)
      if md
        char_name = md[1].capitalize
        character_klass = PlayerCharacters.const_get(char_name)
        puts character_klass

        result[character_klass.description] = -> { character_klass.new }
      end
    end

    result
  end
end
