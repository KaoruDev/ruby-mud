class PickCharacter
  def self.for_player
    Utils::AskQuestions.multiple_choice("Who would you like to be?", nil, possible_player_characters)
  end

  def self.for_enemy
    possibilities = possible_enemy_characters
    choice = 0 #rand(0..(possibilities.length-1))
    possibilities[choice].new
  end

  private

  def self.possible_enemy_characters
    dir_name = "lib/enemy_characters"
    result = []

    Dir.glob("#{dir_name}/*.rb") do |filename|
      md = filename.match(/#{dir_name}\/(\S+)\.rb/)
      if md
        char_name = md[1].capitalize
        character_klass = EnemyCharacters.const_get(char_name)
        result << character_klass
      end
    end

    result
  end

  def self.possible_player_characters
    dir_name = "lib/player_characters"
    result = {}

    Dir.glob("#{dir_name}/*.rb") do |filename|
      md = filename.match(/#{dir_name}\/(\S+)\.rb/)
      if md
        char_name = md[1].capitalize
        character_klass = PlayerCharacters.const_get(char_name)
        result[character_klass.description] = -> { character_klass.new }
      end
    end

    result
  end
end
