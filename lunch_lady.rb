

#create a class for lunch_lady

class Lunch_lady 
  def initialize
    @main = [
      {item: 'Pork Chop', price: 3}, 
      {item: 'Roast Beef', price: 5}, 
      {item: 'Chicken', price: 2.50}]
    @sides = [
      {item: 'Corn', price: 1}, 
      {item: 'Green Beans', price: 1}, 
      {item: 'Mash Potatoes and gravy', price: 2.50}
    ]
    @array_of_main = []
    @array_of_sides = []
    @running_total = 0
    @wallet = 0
    @user = []
    @meal = []

    @main.each do |main|
      @array_of_main << Lunch.new(main[:item], main[:price])
    end

    @sides.each do |side|
      @array_of_sides << Lunch.new(side[:item], side[:price])
    end

  end

  def greeting
    puts "Hello I am the lunch lady".cyan.bold
    puts "Whats your name?".cyan.bold
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~".blue.bold
    user_name = gets
    puts "and how much do you have to spend?"
    user_wallet = gets.to_i
    @wallet += user_wallet
    @user << Person.new(user_name, user_wallet)
    @user[0].say_welcome
  end

  def list_main
    @array_of_main.each do |main|
      main_index = @array_of_main.index(main) + 1
      puts "#{main_index}) #{main.item}~ ~ ~ $#{main.price}".yellow.bold
    end

  end

  def list_side
    @array_of_sides.each do |side|
      side_index = @array_of_sides.index(side) + 1
      puts "#{side_index}) #{side.item}~ ~ ~ $#{side.price}".yellow.bold
    end

  end

  def main_selection
    puts "Please select one item from the list by typing the number"
    main_option = gets.to_i
    main_option -= 1 
    if @array_of_main[main_option].price <= @wallet
      @wallet -= @array_of_main[main_option].price
      @running_total += @array_of_main[main_option].price
      puts "You have selected the #{@array_of_main[main_option].item} which is $#{@array_of_main[main_option].price}"
      puts "You have $#{@wallet} left!" 
    else 
      puts "You dont have enough! Press Enter to pick again or type 'DONE' to leave".red
      user_try = gets.chomp
      if user_try == 'DONE'
        exit(0)
      end
    end
  end

  def side_selection
    puts "Please select one item from the list by typing the number"
    side_option = gets.to_i
    side_option -= 1 
    if @array_of_sides[side_option].price <= @wallet
      @running_total += @array_of_sides[side_option].price
      @wallet -= @array_of_sides[side_option].price
      puts "You have selected the #{@array_of_sides[side_option].item} which is $#{@array_of_sides[side_option].price}"
      puts "You have $#{@wallet} left!" 
    else 
      puts "You dont have enough! Press Enter to pick again or type 'DONE' to leave".red
      user_try = gets.chomp
      if user_try == 'DONE'
        exit(0)
      end
    end
  end


  def finished
    @user[0].say_enjoy
    puts "Have a nice day!".light_green
    exit(0)
  end 
end
