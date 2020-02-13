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

