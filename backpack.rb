class Backpack
  def initialize(attributes)
    @attributes = attributes # a hash containing day_of_week and weather keys
    @items = []
    prepare
  end

  def items
    @items
  end

  def prepare
    # set up local variables used by rest of prepare method
    current_weather
    day_of_week

    # Ensure appropriate clothing is added to backpack
    pack_essential_clothing
    pack_gym_shoes_on_gym_days
    pack_lunch_not_on_weekend
    rainy_day
    cold_day
  end


  def current_weather
    current_weather = @attributes[:weather]
  end

  def day_of_week
    day_of_week = @attributes[:day_of_week]
  end

  def rainy_day
    if current_weather == 'rainy'
    @items << 'umbrella'
   end
 end


  def cold_day
    if current_weather == 'cold'
    @items << 'jacket'
    end
  end


  def pack_gym_shoes_on_gym_days
    # Ensure gym shoes are added to backpack if it's a gym day
    if day_of_week == 'tuesday' || day_of_week == 'thursday'
      @items << 'gym shoes'
    end
  end

  def pack_lunch_not_on_weekend
    # Bring a packed lunch on all weekdays
    if day_of_week != 'saturday' && day_of_week != 'sunday'
      @items << 'packed lunch'
    end
  end

  def pack_essential_clothing
    @items << 'pants'
    @items << 'shirt'
  end

  # Prints a summary packing list for Melinda's backpack
  def summary_of_packing_list
    output = []
    output << "Melinda, here's your packing list!"
    output << "Day: #{@attributes[:day_of_week]}, Weather: #{@attributes[:weather]}"
    output << ""

    @items.each do |item|
      output << "- #{item}"
    end
    output.join("\n")
  end

end
