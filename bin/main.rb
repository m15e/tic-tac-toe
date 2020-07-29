#!/usr/bin/env ruby
require_relative '../lib/logic'

class Interface < Game
  def print_introduction
    puts 'Welcome to Tic Tac Toe!'
    puts 'Player 1, you start! Your move\'s marker is represented by "x".'
    puts 'Player 2, you go next! Your marker is represented by "o".'
    puts 'The goal is to get three of your markers in a row, along the rows, columns or diagonally.'
    puts 'It\'s a draw if the board is full and neither player has succeded.'
    puts "Select a square on the grid below for your next move.\n\n"
    show_game
    show_controls
    puts 'Player 1 please enter your first move:'
  end

  def show_game
    @game[:game_board].each { |row| puts row }
  end

  def show_controls
    puts "\nEnter a number from 1 to 9 to place your marker on the game grid above.\n"
    puts 'The grid below shows where your marker will be placed if you enter a number.'
    MOVE_GUIDE.each { |row| puts row }
  end

  def user_input
    input = gets.chomp
    inp_int = input.to_i
    if input == 'q'
      puts 'Exiting game. See you next time!'
      exit
    elsif @game[:positions].include? inp_int
      @game[:positions].delete(inp_int)
      inp_int

    else
      puts "Invalid entry! Please enter a number not yet entered!\n"
      puts 'Make sure the field you want to play is free! (or press q + enter to quit)'
      user_input
    end
  end

  def play_game
    print_introduction
    while @game[:turn_count] < 9
      player_move(user_input)
      puts 'Game board:'
      show_game
      puts "Player #{next_player} you're up next."
      puts 'Please enter your next move (or press q + enter to quit):'
      next unless @game[:win] == true

      puts 'We have a winner!'
      puts "Player #{current_player} Wins!"
      show_game
      play_again
    end
    puts 'It\'s a draw!'
    play_again
  end

  def play_again
    puts 'Press "p + enter" to play again or "q + enter" to quit:'
    input = gets.chomp
    if input == 'q'
      puts 'Exiting game. See you next time!'
      exit
    elsif input == 'p'
      reset
      play_game
    else
      puts 'Sorry invalid entry.'
      play_again
    end
  end
end
game = Interface.new
game.play_game
