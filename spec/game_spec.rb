require_relative "./spec_helper"

RSpec.describe Game do
  before(:all) do
    @game = Game.new
  end

  it "will setup player and enemy" do
    expect(@game.player).to be_a Player
    expect(@game.enemy).to be_a Enemy
  end

  describe "#pick_characters" do
    it "will ask the player to choose a character and enemy character" do
      silence_questions
      stub_prompter(:output, 1)

      @game.pick_characters
      expect(@game.player.character).not_to be_nil
      expect(@game.enemy.character).not_to be_nil
    end

    it "will generate attributes for both player and character" do
      silence_questions
      stub_prompter(:output, 1)

      @game.pick_characters

      expect(@game.player.hp).not_to be_nil
      expect(@game.enemy.hp).not_to be_nil
    end
  end
end

