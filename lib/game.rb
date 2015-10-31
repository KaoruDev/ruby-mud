class Game
  attr_reader :player, :enemy

  def pick_characters
    @player = PickCharacter.for_player.generate_attributes
    @enemy = PickCharacter.for_enemy.generate_attributes
  end

  def begin_round
    while both_actors_are_alive?
      Utils::Prompter.display_stats(@enemy)
      @player.attack(@enemy)
      @enemy.attack(@player)
    end
  end

  def both_actors_are_alive?
    is_player_alive? && is_enemy_alive?
  end

  def is_player_alive?
    if @player.dead?
      Utils::Prompter.display player_lost_msg
      return false
    end

    true
  end

  def is_enemy_alive?
    if @enemy.dead?
      Utils::Prompter.display player_win_msg
      return false
    end

    true
  end

  private

  def actors
    [@player, @enemy]
  end

  def player_win_msg
    <<-MSG

==========================================================

       YOU HAVE SLAYED THE #{@enemy.fancy_name}!!!

==========================================================

    MSG
  end

  def player_lost_msg
    <<-MSG

==========================================================

       THE #{@enemy.fancy_name} DEVOURS YOUR SOUL!!!

==========================================================

    MSG
  end

end

