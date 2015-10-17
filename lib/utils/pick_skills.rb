module Utils
  class PickSkills
    class << self
      def run
        AskQuestions.multiple_choice("Choose thy skills wisely!", nil, available_skills)
      end

      private

      def available_skills
        {
          'Warrior' => Module.new
        }
      end

    end
  end
end
