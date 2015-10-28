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

        def deal_damage
          @target.take_damage(rand(damage_range))
        end

        def damage_range
          DAMAGE_RANGE
        end

      end

    end
  end
end
