require_relative "./spec_helper"

RSpec.describe Player do
  let(:player) { Player.new }
  let(:player_with_char) { Player.new({ character: PlayerCharacters::Elf.new }) }

  describe "pick_character" do
    it "will assign a character of player's choosing" do
      stub_prompter(:output, 1)
      silence_questions

      player.pick_character
      expect(player.character).not_to be_nil
    end
  end

  describe '#hp' do
    it 'will return a number' do
      expect(player_with_char.hp).to be_instance_of Fixnum
    end

    it 'will delegate to its character' do
      expect(player_with_char.hp).to equal(100)
    end
  end

end
