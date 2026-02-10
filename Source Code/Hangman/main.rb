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

# Boot the game
Game.new.play
