module EnemyCharacters
  class Dragon
    module Actions

      class BasicAttack
        DAMAGE_RANGE = (50..100)

        def self.run_against(target)
          attack = self.new(target)
          attack.deal_damage
        end

        def initialize(target)
          @target = target
        end

        def deal_damage
          @target.take_damage(rand(DAMAGE_RANGE))
        end
      end

    end
  end
end
