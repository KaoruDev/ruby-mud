require_relative "../../spec_helper"

module PlayerCharacters
  class Elf
    module Actions

      RSpec.describe Rain do
        let(:me) { DummyCharacter.new.generate_attributes }
        let(:dummy) { DummyCharacter.new.generate_attributes }

        describe ".run_against" do
          it "will do damage to target" do
            prev_hp = dummy.hp
            prev_mp = me.mp

            Rain.run_against(target: dummy, me: me)

            expect(dummy.hp).to be < prev_hp
            expect(me.mp).to eq(prev_mp - Rain.cost)
          end
        end
      end

    end
  end
end

