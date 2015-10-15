module StubPrompter
  def stub_prompter(method, value=nil)
    allow(Utils::Prompter).to receive(method.to_sym) { value }
  end
end
