require_relative 'train'

class PassengerTrain < Train
  
  def attach_wagon(wagon)
    super(wagon)
    if wagon.is_a?(PassengerWagon)
    else puts 'Тип вагона и тип поезда должны совпадать'
    end
  end

end
