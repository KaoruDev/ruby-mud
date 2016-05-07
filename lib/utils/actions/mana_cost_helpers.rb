module Utils
  module Actions
    module ManaCostHelpers
      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods
        def cost
          self.const_defined?(:COST) ? self.const_get(:COST) : 0
        end
      end
    end
  end
end
