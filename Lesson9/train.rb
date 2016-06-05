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

  def initialize(index, manufacturer = 'Untitled train manufacturer')
    @manufacturer = manufacturer
    @index = index
    @speed = 0
    @station_index = 0
    @carriages = []
    validate!
    @@all_trains[index] = self
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
    add_carriage!(carriage)
  end

  def remove_carriage
    remove_carriage!
  end

  def select_route(route)
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

  def map_carriages
    @carriages.each { |carriage| yield(carriage) }
  end

  def valid?
    validate
  rescue
    false
  end

  private

  def validate!
    number_format = /^([a-zA-z]{3}|[0-9]{3})-?([a-zA-z]{2}|[0-9]{2})$/
    if @speed.nil? || @speed < 0
      raise 'Speed of the train is not valid'
    elsif @manufacturer.nil? || !self.class.valid_length?(1, 100, @manufacturer)
      raise 'Manufacturer is not defined'
    elsif !self.class.valid_length?(1, 20, @index)
      raise 'Number of train is not valid'
    elsif !self.class.valid_format?(number_format, @index)
      raise 'Number of train is not valid'
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
