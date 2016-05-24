require '../Lesson4/carriage'

class Train
  attr_reader :speed, :route, :index, :type, :carriages, :station_index

  def initialize(index)
    @index = index
    @speed = 0
    @station_index = 0
    @carriages = []
  end

  def add_speed(speed = 10)
    change_speed!(speed)
  end

  def reduce_speed(speed = -10)
    change_speed!(speed)
  end

  def stop
    self.speed = 0
  end

  def add_carriage(carriage)
    add_carriage!(carriage) if carriage.class::TYPE == self.class::TYPE_NAME
  end

  def remove_carriage
    remove_carriage!
  end

  def set_route(route)
    set_route!(route)
  end

  def move_forward
    @route.stations.at(@station_index).send_train(self)
    set_current_station_index!(1)
    @route.stations.at(@station_index).receive_train(self)
  end

  def move_backward
    @route.stations.at(@station_index).send_train(self)
    set_current_station_index!(-1)
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

  def change_speed(_speed)
    @speed += 10
  end

  def add_carriage!(carriage)
    carriages << carriage if speed == 0
  end

  def remove_carriage!
    carriages.shift if speed == 0
  end

  def set_current_station_index!(num)
    @station_index += num
  end
end

class CargoTrain < Train
  TYPE_NAME = "Грузовой".freeze
end

class PassengerTrain < Train
  TYPE_NAME = "Пассажирский".freeze
end
