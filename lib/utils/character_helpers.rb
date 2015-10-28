module Utils
  module CharacterHelpers

    def self.included(base)
      base.extend ClassMethods

      base.send(:attr_reader, :hp, :mp)

      base.class_eval do
        def attribute_advantages
          self.class::ATTRIBUTE_ADVANTAGES
        end
      end
    end

    def generate_attributes
      @hp = attribute_advantages[:hp] * rand(100..200)
      @mp = attribute_advantages[:mp] * rand(50..100)
      self
    end

    def attack(character)
      character.take_damage(rand(1..100))
    end

    def take_damage(amount)
      @hp = @hp - calculated_damage(amount)
    end

    private

    def calculated_damage(amount)
      damage_calculator.run(amount)
    end

    def damage_calculator
      @damage_calculator ||= CalculateDamage.new
    end

    def colors
      Utils::Colors
    end

    module ClassMethods
      def colors
        Utils::Colors
      end
    end

  end
end
