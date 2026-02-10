# ==============================================================================
#  Filename: game_spec.rb
#
#  Author: Amey Thakur (https://github.com/Amey-Thakur)
#          Mega Satish (https://github.com/msatmod)
#
#  Repository: https://github.com/Amey-Thakur/HANGMAN-IN-RUBY
#  Release Date: 29 August 2022
#  License: MIT
#
#  Description:
#  Unit tests for the `Game` class. Verifies life deduction and termination logic.
# ==============================================================================

require_relative '../lib/game'

RSpec.describe Game do
  let(:game) { described_class.new }

  describe "#initialize" do
    it "starts with 7 lives" do
      expect(game.lives).to eq(7)
    end

    it "initializes a board and a clue" do
      expect(game.board).to be_a(Board)
      expect(game.clue).not_to be_nil
    end
  end

  describe "Guess Logic (Internal State)" do
    it "decrements lives on incorrect guess" do
      # We manually manipulate the state to avoid mocking gets/puts for this simple unit test
      allow(game).to receive(:game_loop) # Prevent recursion
      game.send(:process_guess, "z") if game.board.word.include?("z") == false
      # Note: Since word is random, we check if z is actually wrong
      unless game.board.word.include?("z")
        expect(game.lives).to eq(6)
      end
    end
  end
end
