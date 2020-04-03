class Player
  attr_accessor :name, :balance
  attr_reader :hand

  def initialize(name)
    @name = name
    @balance = 100
    @hand = Hand.new
  end

  def can_bet?(value)
    value <= @balance ? false : true
  end

  def bet(value)
    can_bet?(value) ? @balance -= value : nil
  end
