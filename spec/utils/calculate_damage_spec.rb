require_relative "../spec_helper"

RSpec.describes CalculateDamage do
  describe "initialize" do
    it "takes a character and the amount of damage" do
      elf = PlayerCharacters::Elf.new
      calculation = CalculateDamage.new(elf, 100)

      expect(calculation.character).to eq elf
      expect(calculation.amount).to eq 100
    end
  end
end

