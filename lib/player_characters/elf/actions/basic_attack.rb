module PlayerCharacters
  class Elf
    module Actions

      class BasicAttack
        DAMAGE_RANGE = (0..100)

        def self.description
          "Let your arrows fly at your foe!"
        end

        def self.run_against(target)
          attack = self.new(target)
          attack.deal_damage
        end

        def initialize(target)
          @target = target
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
