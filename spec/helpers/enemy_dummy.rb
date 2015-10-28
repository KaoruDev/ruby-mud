class EnemyDummy
  include ::Utils::CharacterHelpers

  def fancy_name
    "Dummy!"
  end

  ATTRIBUTE_ADVANTAGES = {
    hp: 10,
    mp: 1
  }
end
