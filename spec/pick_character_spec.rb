require_relative "./spec_helper.rb"

RSpec.describe PickCharacter do
  describe '.for_player' do
    it 'will allow user to pick from a list' do
      stub_prompter(:output, 1)
      silence_questions
      expect(PickCharacter.for_player).to be_instance_of(PlayerCharacters::Elf)
    end
  end

  describe '.for_enemy' do
    it 'will randomly pick for the enemy' do
      character = PickCharacter.for_enemy
      expect(character.instance_of(EnemyCharacters::Dragon) || character.instance_of(EnemyCharacters::Orc)).to be_truthy
    end
  end
end

