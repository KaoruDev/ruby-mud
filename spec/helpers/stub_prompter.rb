module StubPrompter
  def stub_prompter(method, value=nil)
    allow(Utils::Prompter).to receive(method) { value }
  end

  def silence_questions
    allow_any_instance_of(Utils::AskQuestions::MultipleChoice).to receive(:display)
  end
end
