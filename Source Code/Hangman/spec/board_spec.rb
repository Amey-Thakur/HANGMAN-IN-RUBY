# ==============================================================================
#  Filename: board_spec.rb
#
#  Author: Amey Thakur (https://github.com/Amey-Thakur)
#          Mega Satish (https://github.com/msatmod)
#
#  Repository: https://github.com/Amey-Thakur/HANGMAN-IN-RUBY
#  Release Date: 29 August 2022
#  License: MIT
#
#  Description:
#  Unit tests for the `Board` class. Verifies teaser generation, guess
#  processing, and completion logic.
# ==============================================================================

require_relative '../lib/board'

RSpec.describe Board do
  let(:word) { "exotic" }
  subject { described_class.new(word) }

  describe "#initialize" do
    it "sets the word and creates an empty teaser" do
      expect(subject.word).to eq("exotic")
      expect(subject.teaser).to eq(["_", "_", "_", "_", "_", "_"])
    end
  end

  describe "#update" do
    it "reveals correct letters in the teaser" do
      subject.update("e")
      expect(subject.teaser).to eq(["e", "_", "_", "_", "_", "_"])
    end

    it "reveals multiple occurrences of a letter" do
      board = Board.new("banana")
      board.update("a")
      expect(board.teaser).to eq(["_", "a", "_", "a", "_", "a"])
    end
  end

  describe "#complete?" do
    it "returns false when underscores remain" do
      expect(subject.complete?).to be false
    end

    it "returns true when all letters are revealed" do
      "exotic".chars.each { |c| subject.update(c) }
      expect(subject.complete?).to be true
    end
  end
end
