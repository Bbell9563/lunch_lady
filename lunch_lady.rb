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
    puts "Okay #{user_name}How much do you have to spend?".cyan
    user_wallet = gets.to_i
    @wallet += user_wallet
    @user << Person.new(user_name, user_wallet)
    @user[0].say_welcome
  end

  def main_selection
    user_selected = false
    while user_selected == false
      puts "Please select one items from the list by typing the number".blue.bold
      @array_of_main.each do |main|
        main_index = @array_of_main.index(main) + 1
        puts "#{main_index}) #{main.item}~ ~ ~ $#{main.price}".yellow.bold
      end
      first_option = gets.chomp
      if first_option =='QUIT'
        @user[0].say_bye
        exit(0)
      else  
        main_option = first_option.to_i 
        main_option -= 1
        if @array_of_main.include? @array_of_main[main_option]
          if @array_of_main[main_option].price <= @wallet
            @wallet -= @array_of_main[main_option].price
            @running_total += @array_of_main[main_option].price
            @meal << @array_of_main[main_option]
            puts "You have selected the #{@array_of_main[main_option].item} which is $#{@array_of_main[main_option].price}"
            puts "You have $#{@wallet} left!" 
            return
          else 
            puts "You dont have enough! Press Enter to pick again or type 'QUIT' to leave".red
            user_try = gets.chomp
            if user_try == 'QUIT'
              @user[0].say_bye
              exit(0)
            end
          end
        else  
          puts "thats not an item on the list".red
          user_selected == false
        end
      end
    end
    
  end

  def side_selection
    user_selected = false
    while user_selected == false
      puts "Please select one item from the list by typing the number".blue
      @array_of_sides.each do |side|
        side_index = @array_of_sides.index(side) + 1
        puts "#{side_index}) #{side.item}~ ~ ~ $#{side.price}".yellow.bold
      end
      second_option = gets.chomp
      if second_option == 'QUIT'
        @user[0].say_bye
        exit(0)
      else
        side_option = second_option.to_i
        side_option -= 1
        if @array_of_sides.include? @array_of_sides[side_option]
          if @array_of_sides[side_option].price <= @wallet
            @running_total += @array_of_sides[side_option].price
            @wallet -= @array_of_sides[side_option].price
            @meal << @array_of_sides[side_option]
            puts "You have selected the #{@array_of_sides[side_option].item} which is $#{@array_of_sides[side_option].price}"
            puts "You have $#{@wallet} left!" 
            return
          else 
            puts "You dont have enough! Press Enter to pick again or type 'DONE' to leave".red
            user_try = gets.chomp
            if user_try == 'DONE'
              exit(0)
            end
          end
        else  
          puts "thats not an item on the list".red
          user_selected == false
        end
      end
    end
  end

  def state_current_menu
    puts "Your meal consist of".yellow
    @meal.each do |item|
      puts "#{item.item} ~~~ $#{item.price}".red
    end
    puts "You owe $#{@running_total}".yellow
  end

  def restart
    @wallet = @user[0].wallet
    @running_total = 0
    @meal.clear
  end 
  
  def finished
    puts "you paid $#{@running_total}".red
    @user[0].say_enjoy
  end 

  def quit
    @user[0].say_bye
    exit(0)
  end
end
