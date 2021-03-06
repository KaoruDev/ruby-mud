module Utils
  module ActionLoader
    def available_actions(with_descriptions: true)
      {}.tap do |map|
        my_actions.each_with_index do |action, idx|
          next if unable_to_cast(action)

          if with_descriptions
            map[action.description] = action
          else
            map[idx] = action
          end
        end
      end
    end

    private

    def unable_to_cast(action)
      mp < action.cost
    end

    def my_actions
      self.class::Actions.constants.map do |name|
        self.class::Actions.const_get(name)
      end
    end

  end
end
