require "lib/utils/actions/runner_methods"
require "lib/utils/damage_gauge"

module EnemyCharacters
  class Dragon
    module Actions

      class BasicAttack
        include Utils::Actions::RunnerMethods

        DAMAGE_RANGE = (25..120)

        def execute
          damage_dealt = @target.take_damage(rand(DAMAGE_RANGE))

          Utils::DamageGauge.rate(damage_dealt) do |verb, amount|
            Utils::Prompter.display "#{@me.fancy_name}'s CLAW swipe #{verb} you! #{amount}"
          end

          damage_dealt
        end
      end

    end
  end
end
