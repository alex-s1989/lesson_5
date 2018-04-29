require_relative 'instance_counter'

class Station
  include InstanceCounter
  attr_accessor :trains
  attr_reader :name

  @@stations = []
  
  def initialize(name)
    @name = name
    @trains = []
    @@stations << self
    register_instance
  end
  
  def self.all
    @@stations
  end
  
  def arrival_train(train)
    trains << train
  end
  
  def departure_train(train)
    trains.delete(train)
  end
  
  def to_s
    name
  end

end
