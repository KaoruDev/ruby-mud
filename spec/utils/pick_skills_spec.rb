require_relative "../spec_helper"

module Utils
  RSpec.describe PickSkills do
    describe ".run" do

      it "will return a module" do
        allow_any_instance_of(AskQuestions::MultipleChoice).to receive(:display)
        allow(PickSkills).to receive(:available_skills).and_return({
          "Warrior" => Module.new
        })

        expect(Prompter).to receive(:output).and_return(1)
        expect(PickSkills.run).to be_a(Module)
      end

      it "will ask the player to choose a list of skill sets" do
        allow_any_instance_of(AskQuestions::MultipleChoice).to receive(:display)
        expect(Prompter).to receive(:output).and_return(1)
        expect(PickSkills.run).to eq(Skills::Elf)
      end

    end
  end
end

