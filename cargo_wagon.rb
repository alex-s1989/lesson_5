require_relative 'wagon'

class CargoWagon < Wagon
  def to_s
    "Cargo: #{number}"
  end
end
