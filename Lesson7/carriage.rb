require './modules/manufacturer'
require './modules/validator'

class Carriage
  extend Validator
  include Manufacturer

  def initialize(manufacturer = 'Untitled carriage manufacturer')
    @manufacturer = manufacturer
    validate!
  end

  def self.debug(message)
    p "DEBUG!!!! #{message}"
  end

  def to_s
    available = self.class::TYPE == "грузовой" ? 
      "свободный объём #{available_volume}" : "свободных мест #{available_seats}"
    occupied = self.class::TYPE == "грузовой" ? 
      "занятый объём #{filled_volume}" : "занято мест #{occupied_seats}"
    p "Вагон типа #{self.class::TYPE} #{available} и #{occupied}"
  end

  def valid?
    validate!
  rescue
    false
  end

  private

  def validate!
    raise 'Carriage havent manufacturer' if @manufacturer.nil?
    raise 'Carriage havent type' if self.class.to_s !~ /PassengerCarriage|CargoCarriage/
    true
  end
end

class PassengerCarriage < Carriage
  attr_reader :seats, :occupied_seats
  TYPE = "пассажирский".freeze

  def initialize(manufacturer, seats)
    @seats = seats
    @occupied_seats = 0
    super(manufacturer)
  end

  def take_seat
    @occupied_seats += 1 if @occupied_seats <= @seats
  end

  def leave_set
    @occupied_seats -= 1
  end

  def available_seats
    # "In this carriage available #{@seats - @occupied_seats}"
    (@seats - @occupied_seats).to_s
  end

  def occupied_seats
    # "In this carriage #{@occupied_seats} seats already occupied"
    @occupied_seats.to_s
  end
end

class CargoCarriage < Carriage
  TYPE = "грузовой".freeze
  attr_reader :volume, :filled_volume

  def initialize(manufacturer, volume)
    @volume = volume
    @filled_volume = 0
    super(manufacturer)
  end

  def fill(adding_volume = 0)
    @filled_volume += adding_volume if @filled_volume + adding_volume <= @volume
  end

  def available_volume
    # "In this carriage available #{@volume - @filled_volume}"
    (@volume - @filled_volume).to_s
  end

  def filled_volume
    # "In this carriage volume filled to #{@filled_volume}"
    @filled_volume.to_s
  end
end
