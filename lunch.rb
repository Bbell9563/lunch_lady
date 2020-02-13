#create a class for lunch

class Lunch 
  attr_reader :item, :price
  def initialize(item, price)
    @item = item
    @price = price 
  end

  def say_item
    puts "#{item}----$ #{price}"
  end


end
