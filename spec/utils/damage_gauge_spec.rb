require_relative "../spec_helper"

module Utils
  RSpec.describe DamageGauge do
    describe ".rate_damage" do
      context("when damage is 0..50") do

        it "will pass back wounds" do
          DamageGauge.rate_damage(50) do |verb|
            expect(verb).to eq("bruises")
          end

          DamageGauge.rate_damage(rand(0..50)) do |verb|
            expect(verb).to eq("bruises")
          end
        end

      end

      context("when damage is 51..100") do

        it "will pass back viserates" do
          DamageGauge.rate_damage(51) do |verb|
            expect(verb).to eq("wounds")
          end

          DamageGauge.rate_damage(rand(51..100)) do |verb|
            expect(verb).to eq("wounds")
          end
        end

      end
    end
  end
end

