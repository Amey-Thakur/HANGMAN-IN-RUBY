# ==============================================================================
#  Filename: board.rb
#
#  Author: Amey Thakur (https://github.com/Amey-Thakur)
#          Mega Satish (https://github.com/msatmod)
#
#  Repository: https://github.com/Amey-Thakur/HANGMAN-IN-RUBY
#  Release Date: 29 August 2022
#  License: MIT
#
#  Description:
#  The `Board` class encapsulates the state of the word being guessed.
#  It manages the hidden representation (teaser), tracks successful guesses,
#  and determines when the target word has been fully revealed.
# ==============================================================================

# Class representing the Hangman game board
class Board
  attr_reader :word, :teaser

  # Initializes the board with the target word.
  # @param word [String] The word to be guessed.
  def initialize(word)
    @word = word
    @teaser = Array.new(word.length, "_")
  end

  # Updates the teaser if the guess matches any characters in the word.
  # @param guess [String] The single character guessed by the player.
  def update(guess)
    word.chars.each_with_index do |char, index|
      @teaser[index] = char if char == guess
    end
  end

  # Checks if the word has been fully guessed.
  # @return [Boolean] True if no underscores remain in the teaser.
  def complete?
    !teaser.include?("_")
  end

  # Returns a formatted string representation of the current teaser.
  # @return [String] Space-separated letters or underscores.
  def show
    teaser.join(" ")
  end
end
