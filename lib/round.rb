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
    puts "Welcome! You're playing with #{@deck.cards.length} cards."
    puts "---------------------------------------------------------------------"
    evaluate_questions
  end

  def evaluate_questions

    until (@current_card + 1) > @deck.cards.length
      puts "This is card number #{@current_card + 1} out of #{@deck.cards.length}."
      puts "Question: #{@deck.cards[@current_card].question}"
      response = gets.chomp.downcase
      guess = Guess.new(response, @deck.cards[@current_card])
      puts "#{guess.feedback}"
      @current_card += 1
    end
    puts "yay!"

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
