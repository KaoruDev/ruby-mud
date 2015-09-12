class Wizard
  def self.fancy_name
    Utils::Colors.blue("Wizard")
  end

  def self.description
    "#{fancy_name} - a being that has survived time through ancient #{Utils::Colors.green("magic")}."
  end


  def initialize
    puts "I am the Wizard from the Depths Unknown"
  end
end
