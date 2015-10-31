require_relative "../../../spec_helper"

module EnemyCharacters
  class Dragon
    module Actions

      RSpec.describe BreatheFire do
        let(:dragon) { Dragon.new.generate_attributes }
        let(:dummy) { DummyCharacter.new.generate_attributes }

        describe ".cost" do
          it "is 100" do
            expect(BreatheFire.cost).to eq(100)
          end
        end

        describe "#execute" do
          it "decreases character mana by cost" do
            dragon_mp = dragon.mp

            action = BreatheFire.new(dummy, dragon, (1..1))
            action.execute

            expect(dragon.mp + BreatheFire.cost).to eq(dragon_mp)
          end
        end

      end
    end
  end
end

