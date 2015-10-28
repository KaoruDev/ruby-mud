require_relative "../spec_helper"

module Utils
  RSpec.describe ActionLoader do
    let(:basic_attack_class) do
      Class.new do
        def self.description
          'basic attack'
        end

        def run(character)
          character.take_damage(rand(100))
        end
      end
    end

    let(:character_class) do
      Class.new do
        include ActionLoader
      end
    end

    let(:character) { character_class.new }

    describe "#available_actions" do
      it "returns a hash" do
        expect(character).to receive(:my_actions).and_return([basic_attack_class])

        expect(character.available_actions).to be_instance_of Hash
      end

      it "returns a hash with key == to class description and value == class" do
        expect(character).to receive(:my_actions).and_return([basic_attack_class])

        # had to put in this hax cause description is defined in meta class not class itself
        result = character.available_actions

        expect(result[basic_attack_class.description]).to equal(basic_attack_class)
      end
    end
  end
end

