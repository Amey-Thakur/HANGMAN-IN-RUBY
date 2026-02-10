# ==============================================================================
#  Filename: game.rb
#
#  Author: Amey Thakur (https://github.com/Amey-Thakur)
#          Mega Satish (https://github.com/msatmod)
#
#  Repository: https://github.com/Amey-Thakur/HANGMAN-IN-RUBY
#  Release Date: 29 August 2022
#  License: MIT
#
#  Description:
#  The `Game` class acts as the central orchestrator, managing the lifecycle
#  of a Hangman session. It handles word selection, lives management, and
#  coordinates interaction between the `Board` logic and `Display` output.
# ==============================================================================

require_relative 'board'
require_relative 'display'

# Central controller for the Hangman game
class Game
  include Display

  attr_reader :board, :lives, :clue

  # Curated list of words and their associated clues
  WORDS = [
    ["cricket", "A game played by gentlemen"],
    ["jogging", "We are not walking.."],
    ["celebrate", "Remember special moments"],
    ["continent", "There are 7 of these"],
    ["exotic", "Not from around here..."],
    ["amey", "The lead engineer of this project"],
    ["mega", "The brilliant collaborator of this project"]
  ].freeze

  # Initializes a new game session with a random word and 7 lives.
  def initialize
    word_data = WORDS.sample
    @board = Board.new(word_data.first)
    @clue = word_data.last
    @lives = 7
  end

  # Starts the main execution loop of the game.
  def play
    puts display_intro(board.word.length)
    puts display_clue(clue)
    puts board.show
    game_loop
  end

  private

  # The primary recursive/iterative loop for handling player turns.
  def game_loop
    return conclusion if game_over?

    puts "\n" + prompt_guess
    guess = $stdin.gets.chomp.downcase

    process_guess(guess)
  end

  # Determines the outcome of a guess and updates the game state.
  def process_guess(guess)
    return puts display_farewell if guess == "exit"

    if board.word.include?(guess)
      puts display_correct_guess
      board.update(guess)
    else
      @lives -= 1
      puts display_incorrect_guess(lives)
    end

    puts board.show
    game_loop
  end

  # Checks if the game has reached a terminal state (Win or Loss).
  def game_over?
    lives <= 0 || board.complete?
  end

  # Displays the final result of the game session.
  def conclusion
    if board.complete?
      puts display_victory
    else
      puts display_game_over
    end
  end
end
