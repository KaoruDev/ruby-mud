require_relative "../spec_helper"

RSpec.describe Utils::CharacterHelpers do
  let(:test_class) do
    test_class = Class.new do
      include Utils::CharacterHelpers
    end

    test_class::ATTRIBUTE_ADVANTAGES = {
      hp: 1,
      mp: 1,
      min_attack: 2,
      max_attack: 4,
    }

    test_class
  end

  let(:character) { test_class.new.generate_attributes }

  describe '#generate_attributes will generate attributes for the character' do
    it 'hp' do
      expect(character.hp).not_to be_nil
      expect(character.hp).to be_instance_of Fixnum
    end

    it 'min_attack' do
      min_attack = character.instance_variable_get('@min_attack')
      expect(min_attack).to eq(2)
    end

    it 'max_attack' do
      max_attack = character.instance_variable_get('@max_attack')
      expect(max_attack).to eq(4)
    end

    it 'mp' do
      expect(character.mp).not_to be_nil
      expect(character.mp).to be_instance_of Fixnum
    end

    context 'will default to' do
      it 'min_attack of 1' do
        allow_any_instance_of(test_class).to receive(:attribute_advantages).and_return({ hp: 1, mp: 1})
        min_attack = character.instance_variable_get('@min_attack')
        expect(min_attack).to eq(1)
      end

      it 'max_attack of 2' do
        allow_any_instance_of(test_class).to receive(:attribute_advantages).and_return({ hp: 1, mp: 1})
        max_attack = character.instance_variable_get('@max_attack')
        expect(max_attack).to eq(2)
      end
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

  describe "attack_range" do
    it "returns a range from min_attack to max_attack" do
      expect(character.attack_range).to eq((2..4))
    end
  end

  describe "dead?" do
    it "returns a true if hp is =< 0" do
      allow(character).to receive(:hp).and_return(0)
      expect(character.dead?).to be true
    end

    it "returns a false if hp is > 0" do
      expect(character.dead?).to be false
    end
  end

  describe "#decrease_mana_by" do
    it "descreases mp by amount" do
      prev_mana = character.mp

      character.decrease_mana_by(100)

      expect(character.mp + 100).to eq(prev_mana)
    end
  end

end

