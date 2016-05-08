require "lib/utils/damage_gauge"
require "lib/utils/actions/runner_methods"
require "lib/utils/actions/mana_cost_helpers"

module PlayerCharacters
  class Elf
    module Actions

      class TrueShot
        include Utils::Actions::RunnerMethods
        include Utils::Actions::ManaCostHelpers

        DAMAGE_RANGE = (300..500)
        COST = 150

        def self.description
          "Focus your strength on one shot ( #{cost}mp )"
        end

        def self.default_range
          1..1
        end

        def execute
          damage_dealt = @target.take_damage(rand(DAMAGE_RANGE))

          Utils::DamageGauge.rate(damage_dealt) do |verb, amount|
            Utils::Prompter.display "Gaia guides your arrow to deal #{verb} the #{@target.fancy_name}! #{amount}"
          end

          @me.decrease_mana_by(COST)

          damage_dealt
        end

      end

    end
  end
end
