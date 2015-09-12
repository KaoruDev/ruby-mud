module Utils
  class ClassPicker
    class << self
      def pick_class
        AskQuestion.multiple_choice("Which art will you master?", class_choices)
      end

      def class_choices
        roster.inject({}) do |choices, klass|
          choices[klass.description] = -> { klass.new }
          choices
        end
      end

      def roster
        Dir.entries(class_path)[2..-1].map do |filename|
          # Ugh, don't load vim swap files
          next if filename.match(/^\..+\.swp$/)
          class_name = filename.gsub(".rb", "").capitalize
          const_get(class_name) if const_defined?(class_name)
        end.compact
      end

      def class_path
        "#{Dir.pwd}/lib/classes"
      end

    end
  end
end
