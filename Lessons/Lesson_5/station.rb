require_relative 'instance_counter'

class Station
  include InstanceCounter
  attr_reader :name, :trains

  @@created_stations = []

  def initialize(name)
    @name = name
    @trains = []
    @@created_stations.push(self)
  end

  def self.all
    @created_stations
  end  

  def attach_train(train)
    @trains << train
  end

  def detach_train(train)
    @trains.delete(train)
  end

  private

  def trains_by_type(type)
    @trains.select { |train| train.type == type }
  end 
  
end