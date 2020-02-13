#create a class for lunch_lady

class Lunch_lady 
  def initialize
    @main = [
      {item: 'Pork Chop', price: 3}, 
      {item: 'Roast Beef', price: 5}, 
      {item: 'Chicken', price: 2.50}]
    @sides = [
      {item: 'Pork Chop', price: 3}, 
      {item: 'Roast Beef', price: 5}, 
      {item: 'Chicken', price: 2.50}
    ]
    @array_of_main = []
    @array_of_sides = []

    @main.each do |main|
      @array_of_main << Lunch.new(main[:item], main[:price])
    end

  end

  def list_main
    @array_of_main.each do |main|
      main.say_item
    end

  end

  def list_side

  end

  def add_total

  end

end
