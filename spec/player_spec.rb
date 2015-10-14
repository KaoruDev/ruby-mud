require_relative "./spec_helper"

RSpec.describe Player do
  let(:player) { Fabricate(:player) }

  describe "will an attribute of" do
    it("mp") { expect(player.mp).to be_a(Fixnum) }
    it("hp") { expect(player.hp).to be_a(Fixnum) }
  end

end
