class Route
  attr_reader :starting_station, :added_station, :end_station

  def initialize(starting_station, end_station)
    @starting_station = starting_station
    @end_station = end_station
    @added_station = []
  end

  def add_station(station)
    @added_station << station
  end

  def delete(station)
    @added_station.delete(station)
  end

  def stations
    [@starting_station, *@added_station, @end_station]
  end  

  def info
    [starting_station.name, end_station.name].join('-')
  end

end