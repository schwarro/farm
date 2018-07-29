require_relative "crop"

class Farm < Crop
  attr_accessor :total_harvest

  def initialize(name)
    @name = name
    @field = []
    @harvest = 0
  end

  def display_menu
    puts "----------------------------------------"
    puts "Welcome to #{@name} Farm".upcase

    puts "<<~TEXT
      --------------------
            Options
      --------------------
      field -> adds a new field
      harvest -> harvests crops and adds to total harvested
      status -> displays some information about the farm
      relax -> provides lovely descriptions of your fields
      buy -> buy new seeds
      exit -> exits the program
      --------------------
    TEXT"
  end

  def start_game
    while true
      display_menu
      option = gets.chomp
      selectd(option)
    end
  end

  def slected(option)
    case option
    when "field" then create_field
    when "harvest" then harvest
    when "status" then status
    when "relax" then relax
    when "buy" then buy
    when "exit" then end_game
    else
      puts "ERROR: Invalid Option"
      puts "\e[H\e[2J"
    end
  end

  def create_field
    puts "What kind of field is it going to be?"
    Crop.show_all
    type = gets.chomp.downcase

    if super(type)
      print "How large is the field?"
      size = gets.to_i

      @field << Crop.new(type, size)

      puts "Added a #{type} field of #{size} hectares."
    else
      puts "You need more seeds"
    end
  end

  def harvest
    @fields.each do |crop|
      @harvest += crop.yield
      puts "Harvesting #{crop.yields} food from #{crop.size} hectare of #{crop.type} field"
    end

    puts ""
    harvested
    puts "\e[H\e[2J"

  end

  def status
    @fields.each do |field|
      puts "#{field.type.capitalize} field is #{field.size} hectares."
    end

    puts ""
    harvested
    puts "\e[H\e[2J"
  end

  def relax
    @fields.each do |field|
      case field.type
      when 'corn'
        puts "#{field.size} hectares of tall green stalks rustling in the breeze fill your horizon."
      when 'wheat'
        puts "The sun hangs low, casting an orange glow on a sea of #{field.size} hectares of wheat."
      else
        puts "The #{field.size} fields of #{field.type} are doing well."
      end
    end
  end

  def end_game
    puts "See you later!"
  end

  def harvest
    new_crop = gets.chomp.downcase
    puts "Returning to #{@name} Farm"    
  end
end
