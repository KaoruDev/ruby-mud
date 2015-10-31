require_relative "../../spec_helper"

module Utils
  module Actions
    RSpec.describe RunnerMethods do
      let(:action_klass) {
        Class.new do
          include RunnerMethods
        end
      }

      describe ".run_against" do
        it "creates a new instance of the class and calls execute" do
          expect_any_instance_of(action_klass).to receive(:execute).at_least(:once)

          action_klass.run_against
        end

        context "when given a range" do
          it "will run execute within the given range" do
            expect_any_instance_of(action_klass).to receive(:execute).at_least(:twice)
            expect_any_instance_of(action_klass).to receive(:execute).at_most(3)

            action_klass.run_against(action_multiplier: (2..3))
          end
        end
      end
    end
  end
end

