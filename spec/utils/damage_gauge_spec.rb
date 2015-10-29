require_relative "../spec_helper"

module Utils
  RSpec.describe DamageGauge do
    describe ".rate" do
      it "will yield a verb and a string with fancy color damage" do
        DamageGauge.rate(50) do |verb, damage_amount|
          expect(verb).to be_truthy
          expect(damage_amount).to match(/\(\S+?50\S+?\)/)
        end
      end

      context("when damage is 0..50") do

        it "will pass back wounds" do
          DamageGauge.rate(50) do |verb|
            expect(verb).to eq("bruises")
          end

          DamageGauge.rate(rand(0..50)) do |verb|
            expect(verb).to eq("bruises")
          end
        end

      end

      context("when damage is 51..100") do

        it "will pass back viserates" do
          DamageGauge.rate(51) do |verb|
            expect(verb).to eq("wounds")
          end

          DamageGauge.rate(rand(51..100)) do |verb|
            expect(verb).to eq("wounds")
          end
        end

      end
    end
  end
end

