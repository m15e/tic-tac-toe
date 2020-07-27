#!/usr/bin/env ruby
require 'matrix'

class Interface
  require 'io/console'
  
  
  def initialize
    @move_range = [1, 2, 3, 4, 5, 6, 7, 8, 9] # TODO: Transfer to game logic in Milestone 3
    @move_map = { 1 => 0, 2 => 2, 3 => 4, 4 => 0, 5 => 2, 6 => 4, 7 => 0, 8 => 2, 9 => 4 }

    @turn_count = 0
    @player = 2
    @grid = ['_|_|_',
             '_|_|_',
             ' | | ']

    @control_grid = ['1|2|3',
                     '4|5|6',
                     '7|8|9']
    
    print_introduction
    display_game
    display_controls
    puts 'Player 1 please enter your first move (or press q + enter to exit game):'
    play
  end

  def print_introduction
    puts 'Welcome to Tic Tac Toe!'
    puts 'Player 1, you start! Your move\'s marker is represented by "x".'
    puts 'Player 2, you go next! Your marker is represented by "o".'
    puts 'The goal is to get three of your markers in a row, along the rows, columns or diagonally.'
    puts 'It\'s a draw if the board is full and neither player has succeded.'
    puts "Select a square on the grid for your next move.\n\n"
  end

  def display_game
    @grid.each { |row| puts row }
  end

  def display_controls
    puts "\nEnter a number from 1 to 9 to place your marker on the game grid above.\n"
    puts 'The grid below shows where your marker will be placed if you enter a number.'
    @control_grid.each { |row| puts row }
  end
  
  def user_input
    STDIN.noecho(&:gets).chomp
  end

  def player_move
    move = user_input
    move_int = move.to_i
    if move == 'q'
      puts 'Exiting game... See you next time!'
      exit
    end
    if @move_range.include? move_int
      puts "Previous move: #{move}"
      puts "Turn: #{@turn_count}, Player #{@player} is up next."
      if move_int < 4
        @grid[0][@move_map[move_int]] = player_symbol
      elsif move_int > 3 and move_int < 7
        @grid[1][@move_map[move_int]] = player_symbol
      else
        @grid[2][@move_map[move_int]] = player_symbol
      end
    else
      puts 'Invalid entry! Please enter a number from 1 to 9'
    end 
    @turn_count += 1
    @player = next_player
  end

  def player_symbol
    @turn_count.even? ? 'x' : 'o'
  end

  def next_player
    player_symbol == 'x' ? 2 : 1
  end

  def play
    while @turn_count < 9
      player_move
      display_game
      puts 'Please enter your next move:'
      # TODO for game logic: if win condition == True
    end
  end

end


#need something that stores move history

# there's something here - were we add to rows and columns 

# ruby has a matrix class - with diagonal - might make things easier over-all

# row - win
# 1,2,3
# 4,5,6 
# 7,8,9

# col - win always + 3
# 1,4,7
# 2,5,8
# 3,6,9

# diagonal 
# 1,5,9 + 4
# 3,5,7 + 2

# how to store 

g = Interface.new





#g = Interface.new