require "lib/utils/colors"

module Utils
  module ColorAlias

    def self.included(base)
      base.extend ClassMethods
    end

    def color
      Utils::Colors
    end

    module ClassMethods
      def color
        Utils::Colors
      end
    end

  end
end
