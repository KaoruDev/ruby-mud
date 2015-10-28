module Utils
  module ActionLoader
    def available_actions
      {}.tap do |map|
        my_actions.each do |action|
          map[action.description] = action
        end
      end
    end

    private

    def my_actions
      self.class::Actions.constants.map do |name|
        self.class::Actions.const_get(name)
      end
    end

  end
end
