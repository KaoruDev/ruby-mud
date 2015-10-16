require_relative "../../spec_helper"

module Utils
  class AskQuestions
    RSpec.describe MultipleChoice do
      let(:player) { Player.new }

      describe ".run" do
        it "will ask the user a multiple choice question and run the correct option" do
          yes = false


          expect(Prompter).to receive(:output).and_return("2")

          choice = MultipleChoice.new("What is your choice?", player, {
            "option 1" => -> { 'what?' },
            "right option" => -> { yes = true },
            "option 3" => -> { 'squirel!' }
          })

          allow(choice).to receive(:display).at_most(1000).times
          choice.run

          expect(yes).to be true
        end
      end
    end
  end
end
