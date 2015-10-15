class Player
  attr_reader :hp, :mp

  def initialize(configs={})
    @hp = 100
    @mp = 100

    @class_picker = configs[:class_picker]
  end

  def take_damage(amount)
    @hp -= amount
  end

  private

  def class_picker
    @class_picker ||= ClassPicker.new
  end
end

