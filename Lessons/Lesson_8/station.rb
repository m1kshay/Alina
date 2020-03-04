# frozen_string_literal: true

require_relative 'instance_counter'
require_relative 'validatable'

class Station
  include InstanceCounter
  include Validatable

  attr_reader :name, :trains

  @@created_stations = []

  STATION_NAME = /^[a-z]{3}$/i.freeze

  def initialize(name)
    @name = name
    @trains = []
    validate!
    @@created_stations.push(self)
    register_instance
  end

  def trains_block
    @trains.each { |train| yield train }
  end

  def self.all
    @@created_stations
  end

  def attach_train(train)
    @trains << train
  end

  def detach_train(train)
    @trains.delete(train)
  end

  private

  def validate!
    validate_name_empty!
    validate_station_name!
  end

  def validate_name_empty!
    raise ArgumentError, "Name can't be empty" if @name.empty?
  end

  def validate_station_name!
    if @name !~ STATION_NAME
      raise ArgumentError, "Name '#{@name}' has no valid format"
    end
  end

  def trains_by_type(type)
    @trains.select { |train| train.type == type }
  end
end
