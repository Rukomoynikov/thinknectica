require "./modules/manufacturer"
require "./modules/validator"

class Carriage
  extend Validator
  include Manufacturer

  def initialize(manufacturer="Untitled manufacturer")
  	@manufacturer = manufacturer 
  end

  def self.debug(message)
  	p "DEBUG!!!! #{message}"
  end

  def to_s
    "Вагон типа #{self.class::TYPE}"
  end

  def valid?
    raise "Carriage havent manufacturer"  if @manufacturer.nil?
    raise "Carriage havent type" if self.class != "PassengerCarriage" || "CargoCarriage"
    return true
  end

end

class PassengerCarriage < Carriage
  TYPE ="пассажирский"
end

class CargoCarriage < Carriage
  TYPE ="грузовой"
end