# ==============================================================================
#  Filename: main.rb
#
#  Author: Amey Thakur (https://github.com/Amey-Thakur)
#          Mega Satish (https://github.com/msatmod)
#
#  Repository: https://github.com/Amey-Thakur/HANGMAN-IN-RUBY
#  Release Date: 29 August 2022
#  License: MIT
#
#  Description:
#  The entry point for the Hangman console application. It initializes
#  a new `Game` instance and starts the interaction loop.
# ==============================================================================

require_relative 'lib/game'

# Initiates a single game session.
def play_game
  Game.new.play
  repeat_game
end

# Handles the post-game interaction flow.
def repeat_game
  puts "\nWould you like to play a new game? Press 'y' for yes or 'n' for no."
  repeat_input = $stdin.gets.chomp.downcase
  if repeat_input == 'y'
    play_game
  else
    puts 'Thanks for playing!'
  end
end

# Application Entry Point
play_game
