class Game
  def initialize
    @player = choose_class
  end

  def choose_class
    Utils::ClassPicker.pick_class
  end
end

