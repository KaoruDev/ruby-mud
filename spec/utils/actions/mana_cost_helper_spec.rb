require_relative "../../spec_helper"

module Utils
  module Actions
    RSpec.describe ManaCostHelper do
      let (:basic_spell_class) {
        Class.new do
          include ManaCostHelper
        end
      }

      describe ".cost" do
        it "returns 0 " do
          expect(basic_spell_class.cost).to eq(0)
        end
      end
    end
  end
end

