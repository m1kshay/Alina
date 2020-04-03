# frozen_string_literal: true

require_relative 'instance_counter'
require_relative 'validation'

class Route
  include InstanceCounter
  include Validation

  attr_reader :starting_station, :added_station, :end_station

  def initialize(starting_station, end_station)
    @starting_station = starting_station
    @end_station = end_station
    @added_station = []
    register_instance
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