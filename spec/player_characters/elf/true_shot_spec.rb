require_relative "../../spec_helper"

module PlayerCharacters
  class Elf
    module Actions

      RSpec.describe TrueShot do
        let(:dummy) { DummyCharacter.new.generate_attributes }
        let(:me) { DummyCharacter.new.generate_attributes }

        describe ".run_against" do
          it "will do damage to target" do
            prev_hp = dummy.hp
            prev_mp = me.mp

            TrueShot.run_against(target: dummy, me: me)

            expect(dummy.hp).to be < prev_hp
            expect(me.mp).to eq(prev_mp - TrueShot.cost)
          end
        end
      end

    end
  end
end

