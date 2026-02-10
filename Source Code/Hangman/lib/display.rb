# ==============================================================================
#  Filename: display.rb
#
#  Author: Amey Thakur (https://github.com/Amey-Thakur)
#          Mega Satish (https://github.com/msatmod)
#
#  Repository: https://github.com/Amey-Thakur/HANGMAN-IN-RUBY
#  Release Date: 29 August 2022
#  License: MIT
#
#  Description:
#  The `Display` module centralizes all text-based output and terminal UI logic.
#  It ensures a clean separation between the game's computational state and its
#  visual presentation, facilitating consistency and professional CLI styling.
# ==============================================================================

# Module for Hangman display logic
module Display
  # Introduction message welcoming the user to the game.
  def display_intro(word_length)
    "\nNew Game started... your word is #{word_length} characters\n" \
    "To exit game at any point, type 'exit'\n"
  end

  # Displays the current clue to the player.
  def display_clue(clue)
    "Clue is: #{clue}\n"
  end

  # Prompts the player for a guess.
  def prompt_guess
    "Enter a letter"
  end

  # Feedback for a successful guess.
  def display_correct_guess
    "You are correct"
  end

  # Feedback for an incorrect guess, indicating remaining lives.
  def display_incorrect_guess(lives)
    "Sorry... you have #{lives} left. Try again"
  end

  # Final victory message.
  def display_victory
    "Congratulations... you have won this round!"
  end

  # Game over message when lives reach zero.
  def display_game_over
    "Game Over... Better Luck Next Time!"
  end

  # Farewell message on exit.
  def display_farewell
    "Thank you for playing!"
  end
end
