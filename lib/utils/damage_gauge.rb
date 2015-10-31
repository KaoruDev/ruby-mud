require "lib/utils/color_alias"

module Utils
  class DamageGauge
    include Utils::ColorAlias

    def self.rate(damage)
      verb = if damage < 51
               "bruises"
             elsif damage < 101
               "wounds"
             elsif damage < 201
               "gashes"
             else
               "does ---->> #{color.randomize_letters("GODLIKE")} <<---- damage to"
             end

      yield(verb, fancy_display_for(damage))
    end

    def self.fancy_display_for(damage)
      "(#{color.red(damage)})"
    end
  end
end
