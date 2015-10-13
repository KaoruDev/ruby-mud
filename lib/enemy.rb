class Enemy
  attr_reader :hp

  def initialize
    @hp = 100
  end

  def take_damage(amount)
    @hp -= amount
  end
end
