require 'minitest/autorun'
require 'minitest/pride'
require "./lib/guess.rb"
require "./lib/card.rb"
require "pry"

class GuessTest < MiniTest::Test

  def test_it_creates_a_new_guess
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_equal "Juneau", guess.response
    assert_equal card, guess.card
  end

  def test_can_evaluate_a_correct_guess
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert guess.correct?
  end

  def test_can_evaluate_a_incorrect_guess
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Denver", card)
    refute guess.correct?
  end

  def test_can_give_feedback
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_equal "Correct!", guess.feedback
  end

  def test_can_give_negative_feedback
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneauxx", card)
    assert_equal "Incorrect!", guess.feedback
  end
end
