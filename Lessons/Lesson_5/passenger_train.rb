require_relative 'train'

class PassengerTrain < Train

  def initialize(number)
    super(number)
    @type =:pass

  def attachable_wagon?(wagon)
    wagon.is_a?(PassengerWagon)
  end
end