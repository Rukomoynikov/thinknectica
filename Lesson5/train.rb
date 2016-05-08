# Класс Train (Поезд):
# Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов, эти данные указываются при создании экземпляра класса
# Может набирать скорость
# Может показывать текущую скорость
# Может тормозить (сбрасывать скорость до нуля)
# Может показывать количество вагонов
# Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает или уменьшает количество вагонов). Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
# Может принимать маршрут следования (объект класса Route)
# Может перемещаться между станциями, указанными в маршруте.
# Показывать предыдущую станцию, текущую, следующую, на основе маршрута
require './carriage'
require './modules/manufacturer'

class Train
  include Manufacturer
  attr_reader :speed, :route, :index, :type, :carriages, :station_index

  def self.find(index)
    train = @@all_trains.select{ |train| train.index == index}
    train.length ? train[0] : nil
  end

  @@all_trains = []
  def initialize(index, manufacturer = "Untitled manufacturer")
    self.manufacturer = manufacturer
    @index = index
    @speed = 0
    @station_index = 0
    @carriages = []
    @@all_trains << self
  end

  def add_speed(speed = 10)
    self.change_speed!(speed)
  end

  def reduce_speed(speed = -10)
    self.change_speed!(speed)
  end

  def stop
    self.speed = 0
  end

  def add_carriage(carriage)
    self.add_carriage!(carriage) if carriage.class::TYPE == self.class::TYPE_NAME
  end

  def remove_carriage
    self.remove_carriage!
  end

  def set_route(route)
    self.set_route!(route)
  end

  def move_forward
    @route.stations.at(@station_index).send_train(self)
    self.set_current_station_index!(1)
    @route.stations.at(@station_index).receive_train(self)
  end

  def move_backward
    @route.stations.at(@station_index).send_train(self)
    self.set_current_station_index!(-1)
    @route.stations.at(@station_index).receive_train(self)
  end

  def show_station(type)
    if type == 'previous'
      @route.stations.at(@station_index - 1).receive_train(self)
    elsif type == 'next'
      @route.stations.at(@station_index + 1).receive_train(self)
    elsif type == 'current'
      @route.stations.at(@station_index).receive_train(self)
    end
  end

  protected

  attr_writer :speed, :route, :index, :type, :carriages, :station_index

  def set_route!(route)
    self.route = route
  end

  def change_speed(speed)
    @speed += 10
  end

  def add_carriage!(carriage)
    self.carriages << carriage if self.speed == 0
  end

  def remove_carriage!
    self.carriages.shift if self.speed == 0
  end

  def set_current_station_index!(num)
    @station_index += num
  end

end

class CargoTrain < Train
  TYPE_NAME = "Грузовой"
end

class PassengerTrain < Train
  TYPE_NAME = "Пассажирский"
end