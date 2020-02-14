require_relative 'lunch'
require_relative 'lunch_lady'
require_relative 'person'
require 'colorize'

lunch_menu = Lunch_lady.new
lunch_menu.greeting
puts "Type 'QUIT' at any time to quit".yellow
user_not_done = true

while user_not_done == true
  puts "Would you like to buy a meal, 'y' for yes".cyan
  user_input = gets.chomp
  if user_input =='y'
    user_done = false
    while user_done == false
      lunch_menu.main_selection
      lunch_menu.side_selection
      lunch_menu.side_selection
      user_moving_on = false
      while user_moving_on == false
        puts "would you like to add a side yes or no".cyan
        user_answ = gets.chomp
        if user_answ == 'yes'
          lunch_menu.side_selection
        elsif user_answ =='no'
          user_moving_on == true
          break
        elsif user_answ == 'QUIT'
          lunch_menu.quit

        else
          "that wasnt a given selection".red
          user_moving_one = false
        end
      end
      lunch_menu.state_current_menu
      puts "To pay for this meal press enter, to restart meal selection type 'RESTART'"
      user_choose = gets.chomp
      if user_choose == 'RESTART'
        puts "We are reseting your meal".red
        lunch_menu.restart 
        user_done ==  false
      elsif user_choose == 'QUIT'
        lunch_menu.quit
      else  
        break
      end
    end
    lunch_menu.finished
  elsif user_input =="QUIT"
    lunch_menu.quit
  else  
    puts "I dont know what to do with that"
  end
end

puts "yp"