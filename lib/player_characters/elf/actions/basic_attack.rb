require "lib/utils/actions/runner_methods"

module PlayerCharacters
  class Elf
    module Actions

      class BasicAttack
        include Utils::Actions::RunnerMethods

        DAMAGE_RANGE = (0..100)

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

        def damage_range
          DAMAGE_RANGE
        end

      end

    end
  end
end
