module Utils
  class AskQuestions
    class MultipleChoice
      def self.run(question, player, options={})
        multiple_choice = self.new(question, player, options)
        multiple_choice.run
      end

      def initialize(question, player, options={})
        @question = question
        @options = options
        @player = player
      end

      def run
        display(@question)
        display_options
        response = Prompter.run(player: @player)
        answer = find_answer(response)

        unless answer
          Prompter.didnt_get_that
          return self.class.run(@question, @player, @options)
        end

        answer
      end

      private

      def display_options
        @options.keys.each_with_index do |option_desc, idx|
          display("#{idx + 1}) #{option_desc}")
        end
        display
      end

      def find_answer(response)
        idx = response.to_i - 1
        if idx >= 0 && key = @options.keys[idx]
          value = @options[key]

          if value.is_a? Proc
            value.call
          end

          value
        end
      end

      def display(text="")
        puts text
      end
    end
  end
end

