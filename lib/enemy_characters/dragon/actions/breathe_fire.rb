require "lib/utils/damage_gauge"
require "lib/utils/actions/runner_methods"
require "lib/utils/color_alias"

module EnemyCharacters
  class Dragon
    module Actions
      class BreatheFire
        include Utils::Actions::RunnerMethods
        include Utils::ColorAlias

        DAMAGE_RANGE = (100..500)

        def self.cost
          100
        end

        def execute
          damage_dealt = @target.take_damage(rand(DAMAGE_RANGE))

          Utils::DamageGauge.rate(damage_dealt) do |verb, amount|
            Utils::Prompter.display "#{@me.fancy_name} breathes deeply and releases a tunnel of #{color.red("FIRE")} #{verb} you! #{amount}"
          end

          @me.decrease_mana_by(self.class.cost)

          damage_dealt
        end

        def self.default_range
          (1..1)
        end

      end
    end
  end
end
