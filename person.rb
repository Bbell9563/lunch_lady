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

  def say_bye
    puts "Have a nice day #{name}".green.bold
  end
end

