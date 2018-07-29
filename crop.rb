class Crop
  @@crops = ["corn", "wheat"]

  attr_accessor :type, :size, :total_yield

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
    @@crops.each do |type|
    puts "- #{type.capitalize}"
    end
  end

  def buy_type
    if !@@crops.include?(type)
      @@crops << buy_type
      sleep(1)
      puts "Here are your new #{type} seeds."
    else
      sleep(1)
      puts "You already have #{type} seeds."
    end
  end

  def yield
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
