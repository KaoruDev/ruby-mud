require_relative "../spec_helper"

RSpec.describe Utils::CharacterHelpers do
  let(:test_class) do
    test_class = Class.new do
      include Utils::CharacterHelpers
    end

    test_class::ATTRIBUTE_ADVANTAGES = {
      hp: 1,
      mp: 1
    }

    test_class
  end

  let(:character) { test_class.new }

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

