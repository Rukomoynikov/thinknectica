class Carriage
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