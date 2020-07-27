#!/usr/bin/env ruby

class Interface
  require 'io/console'
  def initialize
    @move_range = [1, 2, 3, 4, 5, 6, 7, 8, 9] # TODO: Transfer to game logic in Milestone 3
    @move_map = { 1 => 0, 2 => 2, 3 => 4, 4 => 0, 5 => 2, 6 => 4, 7 => 0, 8 => 2, 9 => 4 }
    @win_conditions = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
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

  def valid_input    
    input = STDIN.noecho(&:gets).chomp  
    in_int = input.to_i  
    if input == 'q'
      puts 'Exiting game. See you next time!'
      exit
    elsif @move_range.include? in_int
      @move_range.delete(in_int)
      return in_int
    else
      puts "Invalid entry! Please enter a number from 1 to 9.\n" 
      puts 'Make sure the field you want to play is free! (or press q + enter to quit)'
      valid_input
    end
  end

  def player_move
    move = valid_input     
    puts "Previous move: #{move}"
    puts "Turn: #{@turn_count + 1}, Player #{@player} is up next."
    if move < 4
      @grid[0][@move_map[move]] = player_symbol
    elsif move > 3 and move < 7
      @grid[1][@move_map[move]] = player_symbol
    else
      @grid[2][@move_map[move]] = player_symbol
    end

    @win_conditions.each do |wc|
      if wc.include?(move)
        wc[wc.index(move)] = player_symbol        
      end
      if wc.all?(player_symbol) 
        puts "We have a winner!"
        puts "Player #{current_player} (#{player_symbol}) Wins!"
        display_game
        exit      
      end
    end
    
    p "Game log:"
    p @win_conditions

    @turn_count += 1
    @player = next_player    
  end

  def player_symbol
    @turn_count.even? ? 'x' : 'o'
  end

  def current_player
    player_symbol == 'o' ? 2 : 1
  end

  def next_player
    player_symbol == 'x' ? 2 : 1
  end

  def play
    while @turn_count < 9
      player_move
      display_game
      puts 'Please enter your next move:'
      # TODO: for game logic: if win condition == True
    end
    puts 'We have a draw!'
    display_game
  end
end

# test game
Interface.new

