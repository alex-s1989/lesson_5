require_relative 'instance_counter'

class Route
  include InstanceCounter
  attr_reader :list_stations
  
  def initialize(start_station, finish_station)
    @list_stations = [start_station, finish_station]
    register_instance
  end
  
  def add_interval_stations(station)
    list_stations.insert(-2, station)
  end

  def delete_interval_stations(station)
    list_stations.delete(station)
  end

  def print_route
    list_stations.each { |station| puts station }
  end
  
  def to_s
    "#{list_stations.first} - #{list_stations.last}"
  end
  
end
