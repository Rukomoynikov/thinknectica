require './modules/validator'
# Класс Station (Станция):
# Имеет название, которое указывается при ее создании
# Может принимать поезда (по одному за раз)
# Может показывать список всех поездов на станции, находящиеся в текущий момент
# Может показывать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
# Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).

class Station
  extend Validator
  attr_accessor :name, :trains

  def self.all
    p @@stations_list.to_s
  end

  @@stations_list = []
  def initialize(name)
    @name = name if self.class.valid_length?(1,10,name)
    @@stations_list << self
    @trains = []
  end

  def receive_train(train)
    @trains << train
    p "Поезд #{train.index} прибыл на платформу #{self.name}"
  end

  def send_train(train)
    @trains.delete(train)
    p "Поезд #{train.index} убыл c платформы #{self.name}"
  end

  def trains_list(type)
    p "На станции #{self.name} всего #{trains.length} поездов."
    p "-------------------------------------------------------"
    if type
      p "Типа #{type.capitalize} на станции всего"
      @trains.map do |train|
        p "Поезд #{train.index} типа #{train.type}" if train.type == type
      end
    else
      @trains.map do |train|
        p "Поезд #{train.index} типа #{train.type}"
      end
    end
  end

  def valid?
    raise "Name for station #{self} is not valid" if !self.class.valid_length?(0,10,@name)
    return true
  end
  
end