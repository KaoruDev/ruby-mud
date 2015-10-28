require_relative "../spec_helper"

module PlayerCharacters
  RSpec.describe Elf do

    it "has a description" do
      Elf.description
    end

    describe "#attack" do
      let(:elf) { Elf.new }
      let(:orc) { EnemyCharacters::Orc.new.generate_attributes }

      it "asks player to choose an attack" do
        expect(Utils::Prompter).to receive(:output).and_return(1)
        silence_questions

        orc_hp = orc.hp

        elf.attack(orc)

        expect(orc.hp).to be < orc_hp
      end
    end

  end
end

