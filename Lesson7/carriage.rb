require "./modules/manufacturer"
require "./modules/validator"

class Carriage
  extend Validator
  include Manufacturer

  def initialize(manufacturer = "Untitled carriage manufacturer")
  	@manufacturer = manufacturer 
    validate!
  end

  def self.debug(message)
  	p "DEBUG!!!! #{message}"
  end

  def to_s
    "Вагон типа #{self.class::TYPE}"
  end

  def validate!
    begin
      valid?
    rescue Exception => e
      p "Carriage is not valid"
      p "Reason is: #{e}"
      raise
    end
  end

  private 

  def valid?
    raise "Carriage havent manufacturer"  if @manufacturer.nil?
    raise "Carriage havent type" if self.class.to_s !~ /PassengerCarriage|CargoCarriage/
    return true
  end

end

class PassengerCarriage < Carriage
  attr_reader :seats, :occupied_seats
  TYPE ="пассажирский"

  def initialize(manufacturer, seats)
    @seats = seats
    @occupied_seats = 0
    super(manufacturer)
  end

  def take_seat
    @occupied_seats += 1 if @occupied_seats < @seats
  end

  def leave_set
    @occupied_seats -= 1 
  end

  def available_seats
    "In this carriage available #{@seats - @occupied_seats}"
  end

  def occupied_seats
    "In this carriage #{@occupied_seats} seats already occupied"
  end

end

class CargoCarriage < Carriage
  TYPE ="грузовой"
end