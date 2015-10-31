module Utils
  module Actions
    module ManaCostHelper
      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods
        def cost
          0
        end
      end
    end
  end
end
