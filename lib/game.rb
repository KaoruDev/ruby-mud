class Game
  attr_reader :player, :enemy

  def initialize
    @player = Player.new
    @enemy = Enemy.new
  end

  def pick_characters
    characters.each(&:pick_character)
  end

  def begin_round
    @player.take_damage(rand(100))
    @enemy.take_damage(rand(100))
  end

  private

  def characters
    [@player, @enemy]
  end

end

