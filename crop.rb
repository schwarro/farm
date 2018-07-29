class Crop
  @@crops = ["corn", "wheat"]

  attr_accessor :type, :size, :yields

  def initialize(type, size)
    if @@crops.include?(type)
      @type = type
      @size = size
    else
      puts "You only have the following crops available to grow: "
      Crop.show_all
    end
    @yield = 0
  end

  def self.show_all
    @@crops.each {|type| puts "- #{type.capitalize}" }
  end

  def buy(type)
    if !@@crops.include?(type)
      @@crops << type
      puts "Here are your new #{type} seeds."
    else
      puts "You already have #{type} seeds."
    end
  end

  def yields
    yields = (@@crops.index(@type) + 1) * Random.rand(1..6)
    @yields = yields * self.size

    return @yields
  end

  def field(type)
    if @@crops.include?(type)
      return true
    else
      return false
    end
  end
end
