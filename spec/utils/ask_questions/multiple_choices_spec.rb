require_relative "../../spec_helper"

module Utils
  class AskQuestions
    RSpec.describe MultipleChoice do
      describe ".run" do
        before(:all) do
          test_details = @test_details = {
            yes: false
          }

          @choice = MultipleChoice.new("What is your choice?", nil, {
            "option 1" => 'what?',
            "right option" => -> { test_details[:yes] = true },
            "option 3" => 4
          })
        end

        it "will ask the user a multiple choice question and run the correct option" do
          expect(Prompter).to receive(:output).and_return("2")
          allow(@choice).to receive(:display)

          @choice.run

          expect(@test_details[:yes]).to be true
        end

        it "will return answer if not a proc" do
          allow(@choice).to receive(:display)
          expect(Prompter).to receive(:output).and_return("1")

          expect(@choice.run).to eq('what?')
        end

        it "will ask again if invalid answer is given" do
          allow(@choice).to receive(:display)
          allow_any_instance_of(MultipleChoice).to receive(:display)
          expect(Prompter).to receive(:output).and_return("babah")
          expect(Prompter).to receive(:didnt_get_that)
          expect(Prompter).to receive(:output).and_return("3")

          expect(@choice.run).to eq(4)
        end
      end
    end
  end
end
