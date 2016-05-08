require "lib/utils/damage_gauge"
require "lib/utils/actions/runner_methods"
require "lib/utils/actions/mana_cost_helpers"

module PlayerCharacters
  class Elf
    module Actions

      class Rain
        include Utils::Actions::RunnerMethods
        include Utils::Actions::ManaCostHelpers

        ATTACK_COPY = [
          %q{An arrow STRIKES your enemy from above and deals ==verb== the ==target==! ==amount==},
          %q{Gaia assists from the heaven and deals ==verb== the ==target==! ==amount==},
          %q{Your volley of arrows ==verb== the ==target==! ==amount==},
        ]

        DAMAGE_RANGE = (1..50)
        COST = 300

        def self.description
          "Fight in the shadows of your arrows ( #{cost}mp )"
        end

        def self.default_range
          30..50
        end

        def execute
          damage_dealt = @target.take_damage(rand(DAMAGE_RANGE))

          Utils::DamageGauge.rate(damage_dealt) do |verb, amount|
            Utils::Prompter.display attack_desc(verb, amount)
          end

          damage_dealt
        end

        def attack_desc(verb, amount)
          ATTACK_COPY
            .sample.gsub("==verb==", verb)
            .gsub("==amount==", amount)
            .gsub("==target==", @target.fancy_name)
        end

      end

    end
  end
end
