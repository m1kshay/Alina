class Hand
 attr_accessor :cards

  def initialize
    @cards = []
  end

  def take_card(card)
    @cards << card
  end

  def can_take_card?
    @cards.count == 3 ? false : true
  end

	