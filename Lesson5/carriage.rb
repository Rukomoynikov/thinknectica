require "./modules/manufacturer"

class Carriage
  include Manufacturer

  def initialize(manufacturer="Untitled manufacturer")
  	self.manufacturer = manufacturer
  end

  def self.debug(message)
  	p "DEBUG!!!! #{message}"
  end

  def to_s
    "Вагон типа #{self.class::TYPE}"
  end

end

class PassengerCarriage < Carriage
  TYPE ="пассажирский"
end

class CargoCarriage < Carriage
  TYPE ="грузовой"
end