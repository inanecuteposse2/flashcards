require 'minitest/autorun'
require 'minitest/pride'
require "./lib/card.rb"
require "pry"

class CardTest < MiniTest::Test

  def test_it_creates_a_new_card
    card = Card.new("What is the capital of Alaska?", "Juneau")
    assert_equal "What is the capital of Alaska?", card.question
    assert_equal "Juneau",card.answer
  end
end
