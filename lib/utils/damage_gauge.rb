module Utils
  class DamageGauge
    def self.rate_damage(damage)
      verb = if damage < 51
               "bruises"
             elsif damage < 101
               "wounds"
             elsif damage < 201
               "gashes"
             end

      yield(verb)
    end

    def self.fancy_damage(damage)
    end
  end
end
