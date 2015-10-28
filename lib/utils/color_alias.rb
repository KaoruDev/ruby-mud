module Utils
  module ColorAlias

    def self.included(base)
      base.extend ClassMethods
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
