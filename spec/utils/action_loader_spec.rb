require_relative "../spec_helper"

module Utils
  RSpec.describe ActionLoader do
    let(:basic_attack_class) do
      Class.new do
        include Utils::Actions::ManaCostHelpers

        def self.description
          'basic attack'
        end

        def run(character)
          character.take_damage(rand(100))
        end
      end
    end

    let(:high_cost_spell) do
      Class.new do
        include Utils::Actions::ManaCostHelpers

        def self.cost
          10000
        end

        def self.description
          'high cost spell'
        end

        def run(character)
          character.take_damage(rand(100))
        end
      end
    end

    let(:character) { DummyCharacter.new.generate_attributes }
    let(:fake_actions) { [basic_attack_class, high_cost_spell] }

    describe "#available_actions" do
      it "returns a hash" do
        allow(character).to receive(:my_actions).and_return(fake_actions)

        expect(character.available_actions).to be_instance_of Hash
      end

      it "returns a hash with key == to class description and value == class" do
        allow(character).to receive(:my_actions).and_return(fake_actions)

        result = character.available_actions

        expect(result[basic_attack_class.description]).to equal(basic_attack_class)
      end

      it "will filter out actions character does not have enough mana to cast" do
        allow(character).to receive(:my_actions).and_return(fake_actions)

        result = character.available_actions

        expect(result.values).not_to include(high_cost_spell)
      end
    end
  end
end

