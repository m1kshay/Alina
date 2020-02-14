class Train
  attr_reader :number, :type, :speed, :route

  def initialize(number, type)
    @number = number
    @speed = 0
    @type = type
    @current_station_index = 0
    @route = []
    @wagons = []
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

  def attach_wagon(w)
    @wagon = w
    if @speed.zero?
    else
      puts 'Для прицепления вагона необходимо остановить поезд'
    end
    @wagons << wagon
  end

  def detach_wagon(w)
    @wagon = w
    if @speed.zero?
    else
      puts 'Для отцепления вагона необходимо остановить поезд' 
    end
    @wagons.pop
  end

  def add_route(route)
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

  def info
    number
  end 
  
end