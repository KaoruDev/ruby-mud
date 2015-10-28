module EnemyCharacters
  class Dragon
    module Actions

      class BasicAttack
        DAMAGE_RANGE = (50..100)

        def self.run_against(target, me)
          attack = self.new(target, me)
          attack.deal_damage
        end

        def initialize(target, me)
          @target = target
          @me = me
        end

        def deal_damage
          damage_dealt = @target.take_damage(rand(DAMAGE_RANGE))
          Utils::Prompter.display "#{@me.fancy_name} pulls back and deals super damage! (#{damage_dealt})"
          damage_dealt
        end
      end

    end
  end
end
