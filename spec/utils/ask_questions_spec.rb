require_relative "../spec_helper"

module Utils
  RSpec.describe AskQuestions do
    let(:question) { "Do you YOLO?" }

    describe ".yes_no" do
      it 'will ask player a question' do
        yes = false

        expect(Prompter).to receive(:output).with("#{question} (y/n) :> ").and_return("y")
        AskQuestions.yes_no(question, {
          yes: -> { yes = true }
        })

        expect(yes).to be_truthy
      end

      context "user returns an invalid answer" do
        it "will ask again" do
          yes = false

          expect(Prompter).to receive(:output).with("#{question} (y/n) :> ").and_return("asdfsdf").ordered
          expect(Prompter).to receive(:output).with(match("Sorry I didn't get that")).and_return("y").ordered

          AskQuestions.yes_no(question, {
            yes: -> { yes = true }
          })
        end
      end

    end
  end
end

