require "lib/utils/color_alias"

module Utils
  class DamageGauge
    include Utils::ColorAlias

    def self.rate(damage)
      verb = if damage < 51
               "bruises"
             elsif damage < 101
               "wounds"
             elsif damage < 126
               "gashes"
             elsif damage < 151
               "gashes"
             elsif damage < 201
               "#{color.red("devastating")} damage to"
             elsif damage < 251
               "deals #{color.red("MULTILATING")} damage to"
             elsif damage < 301
               ">>#{color.bold("H")}#{color.yellow("AVO")}#{color.bold("C")}<< damage to"
             elsif damage < 351
               ">>#{color.bold("CAT")}#{color.red("ASTRO")}#{color.bold("PHIC")}<< damage to"
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
