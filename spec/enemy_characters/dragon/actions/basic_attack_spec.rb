require_relative "../../../spec_helper"

module EnemyCharacters
  class Dragon
    module Actions
      RSpec.describe BasicAttack do
        let(:dummy) { DummyCharacter.new.generate_attributes }

        describe ".run_against" do
          it "will deal a range of damage to target" do
            prev_hp = dummy.hp

            BasicAttack.run_against(target: dummy, me: dummy)

            damage_dealt = prev_hp - dummy.hp

            expect(BasicAttack::DAMAGE_RANGE).to cover(damage_dealt)
          end

          context "will deal damage within given a range of" do
            it "range (2..4)" do
              expect(dummy).to receive(:take_damage).at_least(:twice).and_call_original
              expect(dummy).to receive(:take_damage).at_most(4).and_call_original

              BasicAttack.run_against(target: dummy, me: dummy, action_multiplier: (1..3))
            end
          end
        end
      end
    end
  end
end

