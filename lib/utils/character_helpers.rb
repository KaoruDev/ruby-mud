require "lib/utils/color_alias"

module Utils
  module CharacterHelpers

    def self.included(base)
      base.class_eval do
        include ColorAlias
        attr_reader :hp, :mp, :effects

        def attribute_advantages
          self.class::ATTRIBUTE_ADVANTAGES
        end
      end
    end

    def generate_attributes
      @hp = attribute_advantages[:hp] * rand(100..150)
      @mp = attribute_advantages[:mp] * rand(50..100)
      @min_attack = attribute_advantages[:min_attack] || 1
      @max_attack = attribute_advantages[:max_attack] || 2
      @effects = []
      self
    end

    def attack(character)
      character.take_damage(rand(1..100))
    end

    def take_damage(amount)
      damage_dealt = calculated_damage(amount)
      @hp = @hp - damage_dealt
      damage_dealt
    end

    def attack_range
      (@min_attack..@max_attack)
    end

    def dead?
      hp <= 0
    end

    def decrease_mana_by(amount)
      @mp = @mp - amount
    end

    def add_effect(effect)
      @effects << effect
    end

    def handle_effects
      @effects.each(&:run)
      @effects = @effects.reject(&:done?)
    end

    private

    def calculated_damage(amount)
      damage_calculator.run(amount)
    end

    def damage_calculator
      @damage_calculator ||= CalculateDamage.new
    end

  end
end
