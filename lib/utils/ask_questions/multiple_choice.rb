module Utils
  class AskQuestions
    class MultipleChoice
      def initialize(question, options)
        @question = question
        @options = options
      end

      def run(player)
        puts @question
        display_options
        response = Prompter.run(player)
        answer = find_answer(response)
        unless answer
          Prompter.didnt_get_that
          self.class.new(@question, @options).run(player)
        end
      end

      def display_options
        @options.keys.each_with_index do |option, idx|
          puts "#{idx + 1}) #{option}"
        end
        puts ""
      end

      def find_answer(response)
        idx = response.to_i - 1
        if idx >= 0 && key = @options.keys[idx]
          @options[key].call
        end
      end
    end
  end
end

