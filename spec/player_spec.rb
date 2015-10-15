require_relative "./spec_helper"

RSpec.describe Player do
  let(:class_picker) { double("ClassPicker") }
  let(:player) do
    Player.new({
      picker: class_picker
    })
  end

  describe "initialize" do
    describe "will create an attribute of" do
      it("mp") { expect(player.mp).to be_a(Fixnum) }
      it("hp") { expect(player.hp).to be_a(Fixnum) }
    end

    it "will ask the user to choose a class" do
    end
  end

end
