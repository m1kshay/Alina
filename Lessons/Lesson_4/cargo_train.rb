require_relative 'train'

class CargoTrain < Train

  def initialize(number)
    super(number)
    @type = :cargo  

  def attachable_wagon?(wagon)
    wagon.is_a?(CargoWagon)
  end
end
