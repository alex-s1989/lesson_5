require_relative 'manufacturer_company'

class Wagon
  include ManufacturerCompany
  
  attr_reader :number
  
  def initialize(number)
    @number = number
  end

end
