require_relative 'wagon'

class CargoWagon < Wagom
  def initialize
    @type = :cargo
  end
end
  