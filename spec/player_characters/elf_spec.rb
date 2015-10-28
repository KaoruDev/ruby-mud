require_relative "../spec_helper"

module PlayerCharacters
  RSpec.describe Elf do

    it "has a description" do
      Elf.description
    end

    describe "#attack" do
      let(:elf) { Elf.new }
      let(:dummy) { DummyCharacter.new.generate_attributes }

      it "asks player to choose an attack" do
        expect(Utils::Prompter).to receive(:output).and_return(1)

        prev_hp = dummy.hp

        elf.attack(dummy)

        expect(dummy.hp).to be < prev_hp
      end
    end

  end
end

