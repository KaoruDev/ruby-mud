require "lib/utils/damage_gauge"
require "lib/utils/actions/runner_methods"
require "lib/utils/actions/mana_cost_helpers"

module PlayerCharacters
  class Elf
    module Actions

      class BasicAttack
        include Utils::Actions::RunnerMethods
        include Utils::Actions::ManaCostHelpers

        DAMAGE_RANGE = (20..60)

        def self.description
          "Let your arrows fly at your foe!"
        end

        def execute
          damage_dealt = @target.take_damage(rand(DAMAGE_RANGE))

          Utils::DamageGauge.rate(damage_dealt) do |verb, amount|
            Utils::Prompter.display "You let loose an arrow which #{verb} the #{@target.fancy_name}! #{amount}"
          end

          damage_dealt
        end

      end

    end
  end
end
