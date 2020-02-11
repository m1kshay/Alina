class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def attach_train(train)
    @trains << train
  end

  def detach_train(train)
    @trains.delete(train)
  end

  def trains_by_type(type)
    @trains.select { |train| train.type == type }
  end

end

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

end

class Train
  attr_reader :number, :type, :number_of_trains, :speed, :route

  def initialize(number, type, number_of_trains)
    @number = number
    @type = type
    @number_of_trains = number_of_trains
    @speed = 0
    @current_station_index = 0
    @route = []
  end

  def increase_speed(n)
    @speed += n
  end

    def decrease_speed(n)
    @speed -= n
    @speed = 0 if @speed < 0
  end

  def stop
    @speed = 0
  end

  def attach_vagon
    if @speed.zero?
       @number_of_trains += 1
    else
      puts 'Для прицепления вагона необходимо остановить поезд'
    end
  end

  def detach_vagon
    if @speed.zero?
       @number_of_trains -= 1
    else
      puts 'Для отцепления вагона необходимо остановить поезд' 
    end
  end

  def add_route(route, starting_station, end_station)
    @route = route
    @current_station_index = 0
    current_station.attach_train(self)
  end

  def current_station
    @route.stations[@current_station_index]
  end

  def previous_station
    return unless @current_station_index.positive?

    @route.stations[@current_station_index - 1]
  end

  def next_station
    @route.stations[@current_station_index + 1]
  end

  def go_next
    return if next_station.nil?

    current_station.detach_train(self)
    @current_station_index += 1
    current_station.attach_train(self)
  end

  def go_previous
    return if previous_station.nil?

    current_station.detach_train(self)
    @current_station_index -= 1
    current_station.attach_train(self)
  end
end
