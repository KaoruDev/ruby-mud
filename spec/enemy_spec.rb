require_relative "./spec_helper"

RSpec.describe Enemy do

  describe "#pick_character" do
    let(:enemy) { Enemy.new }

    it 'will assign a character' do
      enemy.pick_character
      expect(enemy.character).not_to be_nil
    end
  end
end

