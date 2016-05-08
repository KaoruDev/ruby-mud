require "lib/utils/damage_gauge"
require "lib/utils/actions/runner_methods"
require "lib/utils/actions/mana_cost_helpers"

module PlayerCharacters
  class Elf
    module Actions

      class TreantSalve
        include Utils::Actions::RunnerMethods
        include Utils::Actions::ManaCostHelpers
        COST = 50
        HEAL_RANGE = (100..300)
        ROUNDS = 5

        def initialize(*args)
          super
          @rounds_left = ROUNDS
        end

        def self.description
          "Call the Treants to heal your wounds! ( #{cost}mp )"
        end

        def self.rounds
          ROUNDS
        end

        def self.default_range
          1..1
        end

        def execute
          Utils::Prompter.display "Treants give you a salve to aid your wounds"
          @me.decrease_mana_by(COST)
          @me.add_effect(self)
        end

        def run
          healed = rand(HEAL_RANGE)
          @me.take_damage(- healed)
          Utils::Prompter.display "#{Utils::Colors.green("Treant")}'s salve to aid your wounds ( #{healed}hp )"
          @rounds_left -= 1
        end

        def done?
          @rounds_left < 1
        end

      end

    end
  end
end
