require "lib/utils/actions/runner_methods"

module EnemyCharacters
  class Dragon
    module Actions

      class BasicAttack
        include Utils::Actions::RunnerMethods

        DAMAGE_RANGE = (50..100)

        def deal_damage
          damage_dealt = @target.take_damage(rand(DAMAGE_RANGE))
          Utils::Prompter.display "#{@me.fancy_name} pulls back and deals super damage! (#{damage_dealt})"
          damage_dealt
        end
      end

    end
  end
end
