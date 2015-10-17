class Player
  attr_reader :hp, :mp

  def initialize(configs={})
    @hp = 100
    @mp = 100
  end

  def take_damage(amount)
    @hp -= amount
  end

  def pick_skills
    extend Utils::PickSkills.run
  end
end

