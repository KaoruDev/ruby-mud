module Utils
  class AskQuestions
    def self.yes_no(question, actions={})
      response = Prompter.run(custom_text: "#{question} (y/n) ")
      if response.match("y")
        return actions[:yes].call if actions[:yes]
      elsif response.match("n")
        return actions[:no].call if actions[:no]
      end

      Prompter.didnt_get_that
      return yes_no(question, actions)
    end

    def self.multiple_choice(question, options={}, player=nil)
      MultipleChoice.new(question, options).run(player)
    end
  end
end
