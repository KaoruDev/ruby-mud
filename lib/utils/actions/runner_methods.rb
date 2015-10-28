module Utils
  module Actions
    module RunnerMethods

      def initialize(target, me)
        @target = target
        @me = me
      end

      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
        def run_against(target: nil, me: nil)
          attack = self.new(target, me)
          attack.deal_damage
        end
      end

    end
  end
end
