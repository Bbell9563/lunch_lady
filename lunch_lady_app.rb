require_relative 'lunch'
require_relative 'lunch_lady'
require_relative 'person'
require 'colorize'


create a while loop for the app


user_not_done = true

while user_not_done == true
  lunch_menu = Lunch_lady.new
  lunch_menu.greeting
  user_restart = false
  while user_restart == false
    puts "Please select one item from the list"
end