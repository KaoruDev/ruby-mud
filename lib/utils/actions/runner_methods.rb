module Utils
  module Actions
    module RunnerMethods

      def initialize(target, me, action_multiplier)
        @target = target
        @action_multiplier = action_multiplier
        @me = me
      end

      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
        def run_against(target: nil, me: nil, action_multiplier: (1..1))
          action = self.new(target, me, action_multiplier)

          rand(default_range || action_multiplier).times do
            action.execute
          end
        end

        def default_range
          nil
        end
      end

    end
  end
end
