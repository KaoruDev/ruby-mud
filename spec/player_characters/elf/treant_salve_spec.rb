require_relative "../../spec_helper"

module PlayerCharacters
  class Elf
    module Actions

      RSpec.describe TreantSalve do
        let(:dummy) { DummyCharacter.new.generate_attributes }
        let(:effect) { TreantSalve.new(nil, dummy, nil) }

        describe "#run" do
          it "will heal character for x rounds" do
            starting_hp = dummy.hp

            TreantSalve.rounds.times do
              expect { effect.run }.to change { dummy.hp }
            end

            expect(effect.done?).to eq(true)
            expect(dummy.hp).to be > (starting_hp)
          end
        end
      end

    end
  end
end

