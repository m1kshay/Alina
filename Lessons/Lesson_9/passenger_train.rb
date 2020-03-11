# frozen_string_literal: true

require_relative 'train'

class PassengerTrain < Train
  def initialize(number)
    super(number)
    @type = :pass
  end
end
