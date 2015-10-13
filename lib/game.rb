class Game
  attr_reader :player, :enemy

  def initialize
    @player = Player.new
    @enemy = Enemy.new
  end

  def begin_round
    @player.take_damage(rand(100))
    @enemy.take_damage(rand(100))
  end

end

