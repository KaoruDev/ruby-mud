require_relative "../spec_helper"

module Utils
  RSpec.describe Prompter do
    describe ".run" do
      it "will ask user for input" do
        stub_prompter(:output, "1")
        expect(Prompter.run).to eq("1")
      end

      it "will add custom text" do
        stub_prompter(:output)
        Prompter.run(custom_text: "hibby jibby")
        expect(Prompter).to receive(:output).with("hibby jibby :>")
      end

      context "when a player is passed" do
        let(:player) { Fabricate(:player) }

        it "will display a player's stats" do
          player_prompt_match = match(Regexp.new("#{player.hp}.+HP.+#{player.mp}.+MP"))
          readline_dub = class_double("Readline").as_stubbed_const

          expect(readline_dub).to receive(:readline).with(player_prompt_match)
          Prompter.run(player: player)
        end
      end
    end
  end
end
