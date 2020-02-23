require_relative 'company_manufacturer'
require_relative 'instance_counter'
require_relative 'validatable'

class Train
  
  include CompanyManufacturer
  include InstanceCounter
  include Validatable

  attr_reader :number, :type, :speed, :route
  @@trains_number = {}

  TRAIN_NUMBER = /^\w{3}-?\w{2}$/

  def initialize(number, type)
    @number = number
    @speed = 0
    @type = type
    validate!
    @current_station_index = 0
    @route = []
    @wagons = []
    @@trains_number[number] = self
    register_instance
  end

  def self.find(number)
    @@trains_number[number]

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
      puts 'To attach the wagon, you need to stop the train'
    end
    @wagons << wagon
  end

  def detach_wagon(w)
    @wagon = w
    if @speed.zero?
    else
      puts 'To detach the wagon, you need to stop the train' 
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

  private

  def validate!
    validate_number_empty!
    validate_train_number!
  end

  def validate_number_empty!
    raise ArgumentError, "Number can't be empty" if @number.empty?
  end

  def validate_train_number!
    raise ArgumentError, "Number '#{@number}' has no valid format" if @number !~ TRAIN_NUMBER
  end
end