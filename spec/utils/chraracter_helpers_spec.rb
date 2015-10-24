require_relative "../spec_helper"

RSpec.describe Utils::CharacterHelpers do
  class TestCharacter
    include Utils::CharacterHelpers

    ATTRIBUTE_ADVANTAGES = {
      hp: 1,
      mp: 1
    }
  end

  let(:character) { TestCharacter.new }

  describe '#generate_attributes will generate attributes for the character' do
    it 'hp' do
      character.generate_attributes
      expect(character.hp).not_to be_nil
      expect(character.hp).to be_instance_of Fixnum
    end

    it 'mp' do
      character.generate_attributes
      expect(character.mp).not_to be_nil
      expect(character.mp).to be_instance_of Fixnum
    end
  end
end

