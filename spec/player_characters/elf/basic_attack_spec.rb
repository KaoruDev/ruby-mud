require_relative "../../spec_helper"

module PlayerCharacters
  class Elf
    module Actions

      RSpec.describe BasicAttack do
        let(:orc) { EnemyCharacters::Orc.new.generate_attributes }

        describe ".run_against" do
          it "will do damage to target" do
            orc_hp = orc.hp

            BasicAttack.run_against(orc)

            expect(orc.hp).to be < orc_hp
          end
        end
      end

    end
  end
end

