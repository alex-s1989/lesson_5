require_relative 'train'

class CargoTrain < Train
  include InstanceCounter
  
  def attach_wagon(wagon)
    super(wagon)
    if wagon.is_a?(CargoWagon)
    else puts 'Тип вагона и тип поезда должны совпадать'
    end
  end

end
