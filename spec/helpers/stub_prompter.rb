module StubPrompter
  def stub_prompter(method, value=nil)
    allow(Utils::Prompter).to receive(method) { value }
  end
end

class Utils::AskQuestions::MultipleChoice
  def self.puts(*args)
  end

  def puts(*args)
  end
end

class Utils::Prompter
  def self.puts(*args)
  end

  def self.puts(*args)
  end
end

