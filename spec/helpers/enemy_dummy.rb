class DummyCharacter
  include Utils::CharacterHelpers
  include Utils::ActionLoader

  def fancy_name
    "Dummy!"
  end

  ATTRIBUTE_ADVANTAGES = {
    hp: 10,
    mp: 1
  }
end
