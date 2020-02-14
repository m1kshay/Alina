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

  def show_trains
    @trains
  end

  def info
    name
  end  

end