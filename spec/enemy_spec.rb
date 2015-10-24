require_relative "./spec_helper"

RSpec.describe Enemy do
  let(:enemy) { Enemy.new }

  describe "#pick_character" do
    before do
      enemy.pick_character
    end

    it "will assign a character" do
      expect(enemy.character).not_to be_nil
    end

    describe "character will have" do
      it("hp") { expect(enemy.hp).not_to be_nil }
      it("mp") { expect(enemy.mp).not_to be_nil }
    end
  end

  context "attributes" do
    before do
      enemy.pick_character
    end

    describe "#hp" do
      it "will be a fixnum" do
        expect(enemy.hp).to be_instance_of Fixnum
      end

      it "will delegate to character" do
        expect(enemy.hp).to equal(enemy.character.hp)
      end
    end

    describe "#mp" do
      it "will be a fixnum" do
        expect(enemy.mp).to be_instance_of Fixnum
      end

      it "will delegate to character" do
        expect(enemy.mp).to equal(enemy.character.mp)
      end
    end
  end
end

