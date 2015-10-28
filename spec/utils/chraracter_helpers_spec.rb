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

  let(:character) { test_class.new.generate_attributes }

  describe '#generate_attributes will generate attributes for the character' do
    it 'hp' do
      expect(character.hp).not_to be_nil
      expect(character.hp).to be_instance_of Fixnum
    end

    it 'mp' do
      expect(character.mp).not_to be_nil
      expect(character.mp).to be_instance_of Fixnum
    end
  end

  describe "#take_damage" do
    it "will return a fixnum" do
      expect(character.take_damage(100)).to be_instance_of Fixnum
      expect(character.take_damage(0)).to be_instance_of Fixnum
    end

    it "will reduce the amount of damage" do
      prev_hp = character.hp

      allow(character).to receive(:calculated_damage) { 100 }

      character.take_damage(100)

      expect(character.hp + 100).to equal(prev_hp)
    end
  end

end

