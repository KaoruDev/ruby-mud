require_relative "./spec_helper"

RSpec.describe Game do
  before(:all) do
    @game = Game.new
  end

  it "will setup player and enemy" do
    expect(@game.player).to be_a Player
    expect(@game.enemy).to be_a Enemy
  end

  describe "#begin_round" do
    it "will have player attack enemy and vice versa" do
      player_hp = @game.player.hp
      enemy_hp = @game.enemy.hp

      @game.begin_round

      expect(@game.player.hp).to be < player_hp
      expect(@game.enemy.hp).to be < enemy_hp
    end
  end

  describe "#pick_characters" do
    it "will ask the player to choose a character" do
      stub_prompter(:output, 1)
      @game.pick_characters
    end
  end
end

