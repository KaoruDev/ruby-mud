require_relative "../spec_helper"

module Utils
  RSpec.describe CalculateDamage do
    let(:calculator) { CalculateDamage.new }

    describe "#run" do
      it "returns a fixnum" do
        expect(calculator.run(100)).to be_instance_of Fixnum
      end
    end
  end
end

