require_relative "./spec_helper"

RSpec.describe Game do
  before(:all) do
    @game = Game.new
  end

  it "will setup player and enemy" do
    expect(@game.player).to be_a Player
    expect(@game.enemy).to be_a Enemy
  end

  describe "#start" do
    it "will begin to ask user for input" do
    end
  end
end

