#!/usr/bin/env ruby

class Interface

  @@positions = [1,2,3,4,5,6,7,8,9]
  

  def initialize
    puts "\nWelcome to Tic Tac Toe!\n\n"    

    @controls = "1|2|3\n4|5|6\n7|8|9"
    
    @grid = ["_|_|_\n_|_|_\n | | "]
    
   
    

    puts @controls
    puts "\n"
    puts @grid

    puts "\nPlease enter a number between 1-9 to make the first move!"  

  end

  def get_input
    move = gets.chomp.to_i
    
    if @@positions.include? move
      @grid_arr[move-1] = "x"
      puts @grid
    else 
      puts "Invalid entry. Please enter a number from 1 to 9."
    end
  end

end


g = Interface.new

g.get_input


