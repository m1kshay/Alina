
require_relative 'cargo_wagon'
require_relative 'passenger_wagon'
require_relative 'wagon'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'train'
require_relative 'route'
require_relative 'station'

class Main
  attr_reader :trains, :routes, :stations

  def initialize
    @trains = []
    @routes = []
    @stations = []
  end	

  def run_main_menu
    loop do
      main_menu
      choice_number = gets.chomp.to_i
      case choice_numbeк
      when 1 then create_station
			when 2 then create_train
			when 3 then create_route
			when 4 then add_route_station
			when 5 then delete_route_station
			when 6 then set_the_train_route
			when 7 then attach_wagon
			when 8 then detach_wagon
			when 9 then move_train
			when 10 then view_stations_and_trains
      when 11 then occupy
      when 12 then show_wagon
      when 0 then quit
      else
       return 'wrong choice'
      end
    end
  end

  def main_menu
    puts 'Write 1 to create the station'
	  puts 'Write 2 to create the train'
	  puts 'Write 3 to create the route'
	  puts 'Write 4 to add station to the route'
	  puts 'Write 5 to delete station from the route'
	  puts 'Write 6 to set the train route'
	  puts 'Write 7 to attach the wagon to the train'
	  puts 'Write 8 to detach the wagon from the train'
	  puts 'Write 9 to move the train throughout the route'
	  puts 'Write 10 to view a list of stations and trains'
    puts 'Write 11 to occupy wagon capacity'
    puts 'Write 12 to show wagons'
    puts 'Write 0 to quit the program'
  end

  def show_arr(array)
    arr.each.with_index(1) do |item, index|
      puts "#{index} (#{item.info})"
    end
  end

  private

  def create_station
    puts "Put the station's name"
    name = gets.chomp
    validate!
    @stations << Station.new(name)
    p stations
  rescue RuntimeError => e
    puts e.message
    puts "Please try again"
    retry
  end
  
  def create_train
    puts 'Type the train number'
    number = gets.chomp
    puts 'Write 1 for passenger train or write 2 for cargo train'
    type = gets.to_i

    case type
    when 1 then trains << PassengerTrain.new(number)
    when 2 then trains << CargoTrain.new(number)
    end
    p trains
  rescue RuntimeError => e
    puts e.message
    puts "Please try again"
    retry
  ensure
    puts "The train was successfully created"
  end

  def select_from_arr(array)
    index = gets.to_i - 1
    return if index.negative?

    array[index]
  end

   def create_route
    validate!
    puts "Put the route's first station number"
    show_arr(stations)
    first_station = select_from_arr(stations)
    puts "Put the route's last station number"
    show_arr(stations)
    last_station = select_from_arr(stations)

    if first_station.nil? || last_station.nil?
      puts('Put first and last station numbers, please')
    else
      @routes << Route.new(first_station, last_station)
      p routes
    end
  rescue RuntimeError => e
    puts e.message
    puts "Please try again"
    retry
  ensure
    puts 'Route is successfully created'  
  end

  def add_route_station
    if routes.empty?
      puts "You haven't created any routes yet"
    else
      show_arr(routes)
      puts 'Select route to add to station'
      selected_route = select_from_arr(routes)
      return if selected_route.nil?

      show_arr(stations)
      puts 'Select station to add to selected route'
      selected_station = select_from_arr(stations)
      selected_route.add_station(selected_station)
      p routes
    end
  end

  def delete_route_station
    show_arr(routes)
    puts 'Select route to delete the station from'
    selected_route = select_from_arr(routes)
    show_arr(selected_route.stations)

    puts 'Select station to delete from selected route'
    selected_station = select_from_arr(selected_route.stations)
    selected_route.delete_station(selected_station)
    p routes
  end

  def set_a_train_route
    show_arr(routes)
    puts 'Select the route you want set the train to'
    selected_route = select_from_arr(routes)
    return if selected_route.nil?

    show_arr(trains)

    puts 'Select the train you want assign the selected route'
    selected_train = select_from_arr(trains)
    selected_train.set_route(selected_route)
    p routes
  end

  def occupy
    show_arr(trains)
    puts 'Select the train to change its wagon capacity'
    selected_train = select_from_arr(trains)
    return if selected_train.nil?

    if selected_train.is_a?(PassengerTrain)
      puts '1 place will be occupied. Choose the wagon'
      show_arr(selected_train.wagons)
      selected_wagon = select_from_arr(selected_train.wagons)
      selected_wagon.occupy_seat

    elsif selected_train.is_a?(CargoTrain)
      puts 'Choose the wagon'
      show_arr(selected_train.wagons)
      selected_wagon = select_from_arr(selected_train.wagons)
      puts 'Put the wagon volume to occupy'
      capacity = gets.chomp.to_i
      selected_wagon.occupy_capacity(capacity)
    end
    p trains
  end  

  def attach_wagon
    show_arr(trains)
    puts 'Choose the train you want to attach the wagon to'
    selected_train = select_from_arr(trains)
    return if selected_train.nil?

    if selected_train.is_a?(PassengerTrain)
      puts 'Put the seats quantity'
      seats = gets.chomp.to_i
      selected_train.attach_wagon(PassengerWagon.new(seats))

    elsif selected_train.is_a?(CargoTrain)
      puts 'Put the wagon volume'
      capacity = gets.chomp.to_i
      selected_train.attach_wagon(CargoWagon.new(capacity))
    end
    p trains
  end

  def show_wagon; end

  def detach_wagon
    show_arr(trains)
    puts 'Choose the train you want to detach the wagon from'
    selected_train = select_from_arr(trains)
    return if selected_train.nil?

    selected_train.del_wagon
    p trains
  end

  def move_train
    show_arr(trains)
    puts 'Select train to move to the next/previous station'
    selected_train = select_from_arr(trains)
    return if selected_train.nil? || selected_train.route.nil?
    move_train_menu

    case gets.to_i
    when 1 then selected_train.move_forward
    when 2 then selected_train.move_rewind
    end
    p routes
  end

  def move_train_menu
    puts 'Choose the direction to move to: ' \
      '1. Forward ' \
      '2. Backward'
  end

  def view_trains_and_stations
    stations.each do |station|
      puts "Station: #{station.name}"
      puts 'Station trains:'
      show_arr(station.trains)
    end
  end
end  
