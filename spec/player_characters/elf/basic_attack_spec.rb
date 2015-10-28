require_relative "../../spec_helper"

module PlayerCharacters
  class Elf
    module Actions

      RSpec.describe BasicAttack do
        let(:dummy) { DummyCharacter.new.generate_attributes }

        describe ".run_against" do
          it "will do damage to target" do
            prev_hp = dummy.hp

            BasicAttack.run_against(target: dummy)

            expect(dummy.hp).to be < prev_hp
          end
        end
      end

    end
  end
end

