#create a class for lunch

class Lunch 
  attr_reader :item, :price
  def initialize(item, price)
    @item = item
    @price = price 
  end

end


#create a class for person

class Person 
  attr_accessor :name
  def initialize(name)
    @name = name
  end

  def say_welcome
    puts "Welcome #{name}"
  end
end


#create a class for lunch_lady

class Lunch_lady 
  def initialize
    
  end

end


#create a while loop for the app
