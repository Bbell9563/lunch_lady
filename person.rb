#create a class for person

class Person 
  attr_accessor :name, :wallet
  def initialize(name, wallet)
    @name = name
    @wallet = wallet
  end

  def say_welcome
    puts "Welcome #{name}".light_green.bold
  end

  def say_enjoy
    puts "Enjoy your meal #{name}".light_green
  end

end

