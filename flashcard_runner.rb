require "./lib/card"
require "./lib/deck"
require "./lib/round"

card_1 = Card.new("What is 5 + 5?", 10)
card_2 = Card.new("What is Rachel's favorite animal?", "red panda")
card_3 = Card.new("What's Mike's middle name?", "Nobody knows")
card_4 = Card.new("What cardbord cutout lives at Turing?", "Justin Bieber")

deck = Deck.new([card_1, card_2, card_3, card_4])

round = Round.new(deck)
round.start
