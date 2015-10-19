require_relative "./spec_helper"

RSpec.describe Player do
  let(:player) { Player.new }

  describe "pick_character" do
    it "will assign a character of player's choosing" do
      stub_prompter(:output, 1)
      player.pick_character
      expect(player.character).to be_instance_of Character
    end
  end

end
