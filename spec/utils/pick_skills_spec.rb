require_relative "../spec_helper"

module Utils
  RSpec.describe PickSkills do
    describe ".run" do

      it "will return a module" do
        expect(PickSkills.run).to be_a(Module)
      end

      it "will ask the player to choose a list of skill sets" do
        stub_prompter(:run, "1")
        expect(Prompter).to receive(:run).with(any_args)
      end
    end
  end
end

