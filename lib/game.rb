class Game
  attr_reader :player, :enemy

  def initialize
    @player = Player.new
    @enemy = Enemy.new
  end

  def pick_characters
    actors.each do |actor|
      actor.pick_character.generate_attributes
    end
  end

  def begin_round
    @player.take_damage(rand(100))
    @enemy.take_damage(rand(100))
  end

  private

  def actors
    [@player, @enemy]
  end

end

