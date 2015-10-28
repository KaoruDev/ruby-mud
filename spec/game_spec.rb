require_relative "./spec_helper"

RSpec.describe Game do
  let(:game) { Game.new }

  describe "#pick_characters" do
    it "will ask the player to choose a character and enemy character" do
      stub_prompter(:output, 1)

      game.pick_characters

      expect(game.player).not_to be_nil
      expect(game.enemy).not_to be_nil
    end

    it "will generate attributes for both player and character" do
      stub_prompter(:output, 1)

      game.pick_characters

      expect(game.player.hp).not_to be_nil
      expect(game.enemy.hp).not_to be_nil
    end
  end

  describe "#begin_round" do
    it "will have actors attack each other" do
      stub_prompter(:output, 1)

      game.pick_characters

      player_hp = game.player.hp
      enemy_hp = game.enemy.hp

      game.begin_round

      expect(game.player.hp).to be < (player_hp)
      expect(game.enemy.hp).to be < (enemy_hp)
    end

    it "will continue until an actor has < 0 hp" do
      stub_prompter(:output, 1)

      allow(PickCharacter).to receive(:for_enemy) { DummyCharacter.new.generate_attributes }

      game.pick_characters

      game.begin_round

      expect(game.enemy.hp <= 0 || game.player.hp <= 0).to be true
    end
  end
end

