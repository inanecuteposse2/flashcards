require 'minitest/autorun'
require 'minitest/pride'
require "./lib/guess.rb"
require "./lib/card.rb"
require "./lib/round.rb"
require "./lib/deck.rb"
require "pry"

class RoundTest < MiniTest::Test

  def test_it_creates_a_new_round
    round = Round.new("")
    assert_equal round.class, Round
  end

  def test_it_can_give_deck
    round = Round.new("")
    assert_equal "", round.deck
  end

  def test_it_starts_with_empty_guesses
    round = Round.new("")
    assert_equal [], round.guesses
  end

  def test_it_should_know_which_card_is_current
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal card_1, round.current_card
  end

  def test_it_can_record_guess
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal card_1, round.record_guess("Juneau").card
    # assert_equal "Juneau", round.record_guess("Juneau").card.answer
  end

  def test_it_can_count_the_number_of_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("Seattle")
    assert_equal 1, round.guesses.count
  end

  def test_it_can_return_feedback
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("Juneau")
    assert_equal 1, round.guesses.count
    assert_equal "Correct!", round.guesses.first.feedback
  end

  def test_it_can_return_number_of_correct_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("Juneau")
    round.guesses.first.feedback
    assert_equal 1, round.correct_guess_counter
    round.record_guess("58")
    assert_equal 1, round.correct_guess_counter
  end

  def test_it_can_return_a_current_card
    card_1 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    card_2 = Card.new("What is the capital of Alaska?", "Juneau")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal card_1, round.current_card
  end

  def test_it_can_return_two_guesses
    card_1 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    card_2 = Card.new("What is the capital of Alaska?", "Juneau")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("Denver")
    round.record_guess("Colorado")
    assert_equal 2, round.guesses.count
  end

  def test_it_can_return_a_current_card_question
    card_1 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    card_2 = Card.new("What is the capital of Alaska?", "Juneau")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal "Approximately how many miles are in one astronomical unit?", round.current_card.question
  end

  def test_it_can_return_a_current_card_answer
    card_1 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    card_2 = Card.new("What is the capital of Alaska?", "Juneau")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal "93,000,000", round.current_card.answer
  end

  def test_it_can_return_the_last_guess_feedback
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("Juneau")
    round.record_guess("Juneau")
    assert_equal 2, round.guesses.count
    assert_equal "Incorrect!", round.guesses.last.feedback
  end
end
