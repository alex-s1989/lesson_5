require_relative 'wagon'

class PassengerWagon < Wagon
  
  def to_s
    "Passenger: #{number}"
  end

end
