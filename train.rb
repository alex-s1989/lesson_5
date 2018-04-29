require_relative 'manufacturer_company'
require_relative 'instance_counter'

class Train
  include ManufacturerCompany
  
  @@all_trains = {}

  def self.find(number)
    @@all_trains[number]
  end
  
  attr_reader :train_number, :speed, :route, :wagons
  
  def initialize(train_number)
    @train_number = train_number
    @wagons = []
    @speed = 0
    @@all_trains[train_number] =  self
    register_instance
  end
  
  def inc_speed(speed)
    return 'Speed is less than zero' if self.speed + speed < 0
    
    self.speed += speed
  end
  
  def stop
    self.speed = 0
  end

  def unhook_last_wagon
    wagons.pop if speed == 0 && wagons > 0
  end

  def unhook_wagon(index)
    wagons.delete_at(index) if speed == 0 && wagons > 0
  end
  
  def take_route(route)
    @index = 0
    @route = route
    
    current_station.arrival_train(self)
  end

  def current_station
    @route.list_stations[@index]
  end

  def move_ahead
    return 'last station' if @index == @route.list_stations.size - 1
    
    departure_train
    @index += 1
    arrival_train
  end

  def move_back
    return 'starting station' if @index == 0
    
    departure_train
    @index -= 1
    arrival_train
  end

  def next_station
    return nil if current_station == @route.list_stations[-1]

    list_stations(@index + 1)
  end

  def previous_station
    return nil if current_station == @route.list_stations[0]

    list_stations(@index - 1)
  end
  
  def to_s
    "#{train_number}, количество вагонов #{wagons.count}"
  end

  def wagons_with_index
    wagons.each_with_index { |wagon, index| puts "#{index} - #{wagon}"}
  end
  
  protected

  def attach_wagon(wagon)
    wagons << wagon if speed == 0
  end
  
  private
  
  attr_writer :speed, :wagons

  def departure_train
    current_station.departure_train(self)
  end
  
  def arrival_train
    current_station.arrival_train(self)
  end
  
  def list_stations(index)
    @route.list_stations[index]
  end
  
end
