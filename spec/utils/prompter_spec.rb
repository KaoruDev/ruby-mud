require_relative "../spec_helper"

module Utils
  RSpec.describe Prompter do
    describe ".run" do
      it "will ask user for input" do
        stub_prompter(:output, "1")
        expect(Prompter.run).to eq("1")
      end

      it "will add custom text" do
        expect(Prompter).to receive(:output).with("hibby jibby:> ")
        Prompter.run(custom_text: "hibby jibby")
      end

      context "when a player is passed" do
        let(:elf) {
          elf = PlayerCharacters::Elf.new
          elf.generate_attributes
          elf
        }

        let(:player) { Player.new({ character: elf }) }

        it "will display a player's stats" do
          player_prompt_match = match(Regexp.new("#{player.hp}.+HP.+#{player.mp}.+MP"))

          expect(Prompter).to receive(:output).with(player_prompt_match)
          Prompter.run(player: player)
        end
      end
    end
  end
end
