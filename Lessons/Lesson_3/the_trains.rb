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
  attr_reader :list_of_stations

  def initialize(starting_station, end_station)
    @starting_station = starting_station
    @end_station = end_station
    @list_of_stations = [@starting_station, @end_station]
  end

  def add(station)
    @list_of_stations.insert(-2, station)
  end

  def delete(station)
    @list_of_stations.delete(station)
  end

end

class Train
  attr_accessor :speed
  attr_reader :number_of_trains, :current_station

  def initialize(number, type, number_of_trains)
    @number = number
    @type = type
    @number_of_trains = number_of_trains
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

  def add_route(route)
    @current_route = route
    @current_station = @current_route.list_of_stations[0]
    @current_station.attach_train(self)
  end

  def previous_station
    index = @current_route.list_of_stations.index(@current_station) - 1
    @current_route.list_of_stations[index]
  end

  def next_station
    index = @current_route.list_of_stations.index(@current_station) + 1
    @current_route.list_of_stations[index]
  end

  def go_next
    @current_station.detach_train(self)
    @current_station = self.next_station
    @current_station.attach_train(self)
  end

  def go_previous
    @current_station.detach_train(self)
    @current_station = self.previous_station
    @current_station.attach_train(self)
  end

end