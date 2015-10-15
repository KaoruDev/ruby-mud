module StubPrompter
  def stub_prompter(method, value=nil)
    allow(Utils::Prompter).to receive(method) { value }
  end
end
