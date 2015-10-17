module Utils
  class PickSkills
    class << self
      def run
        AskQuestions.multiple_choice("Choose thy skills wisely!", nil, available_skills)
      end

      private

      def available_skills
        result = {}
        Dir.glob("lib/skills/*.rb") do |filename|
          begin
            md = filename.match(/lib\/skills\/(\S+)\.rb/)
            if md
              skill_name = md[1].capitalize
              skill_mod = Skills.const_get(skill_name)
              result[skill_mod.description] = skill_mod
            end
          rescue NameError
          end
        end

        result
      end

    end
  end
end
