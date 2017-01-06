class Deck
  attr_reader :cards
  def initialize(cards_array)
    @cards = cards_array
  end

  def count
    @cards.count
  end
end
