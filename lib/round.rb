require_relative "guess"

class Round
  attr_reader :deck, :guesses, :correct_guess_counter

  def initialize(deck)
    @deck = deck
    @guesses = []
    @current_card = 0 #position in the deck array
    @correct_guess_counter = 0
  end

  def current_card
    all_cards = @deck.cards
    all_cards[@current_card]
  end

  def start
    puts "Welcome! You're playing with #{@deck.length} cards."
  "---------------------------------------------------------------------"
  puts "This is card number #{@current_card + 1} out of #{@deck.length}."
  puts "Question: #{@deck.cards[0].question}"
  response = gets.chomp.downcase.to_i
  guess = Guess.new(response, @deck.cards[0])
  puts "#{guess.feedback}"
  end

  def record_guess(guess)
    @guess = Guess.new(guess, current_card)
    @correct_guess_counter += 1 if @guess.correct?
    @guesses << @guess
    @current_card += 1
    @guess
  end

  def number_correct
    @guess.count_correct
  end
end
