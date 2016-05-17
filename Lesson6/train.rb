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
  extend Validator
  include Manufacturer
  @@all_trains = {}
  attr_reader :speed, :route, :index, :type, :carriages, :station_index

  def self.find(index)
    @@all_trains[index]
  end

  def self.all_trains
    @@all_trains
  end

  def initialize(index, manufacturer = "Untitled manufacturer")
    self.manufacturer = manufacturer
    @index = index if self.class.valid_length?(1,20,index) && self.class.valid_format?(/^([a-zA-z]{3}|[0-9]{3})-?([a-zA-z]{2}|[0-9]{2})$/, index)
    @speed = 0
    @station_index = 0
    valid?
    @carriages = []
    @@all_trains[index] = self
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

  def valid?
    begin
      validate!
    rescue
      return false
    end
    return true
  end

  private

  def validate!
   raise "Speed of the train is not valid" if @speed.nil? || @speed < 0
   raise "Manufacturer is not defined" if @manufacturer.nil? || self.class.valid_length?(1,10,@manufacturer)
   raise "Number of traing is not valid" if !self.class.valid_length?(1,20,index) && !self.class.valid_format?(/^([a-zA-z]{3}|[0-9]{3})-?([a-zA-z]{2}|[0-9]{2})$/, index)
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

