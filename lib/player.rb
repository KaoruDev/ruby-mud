class Player
  attr_reader :hp, :mp

  def initialize
    @hp = 100
    @mp = 100
  end

  def take_damage(amount)
    @hp -= amount
  end
end

