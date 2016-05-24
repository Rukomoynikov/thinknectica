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
    validate!
    @carriages = []
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

  def validate!
    begin
      valid?
    rescue Exception => e
      p 'Train is not valid'
      raise "Reason is: #{e}"
    end
    true
  end

  private

  def valid?
    raise 'Speed of the train is not valid' if @speed.nil? || @speed < 0
    raise 'Manufacturer is not defined' if @manufacturer.nil? || !self.class.valid_length?(1, 100, @manufacturer)
    raise 'Number of traing is not valid' if !self.class.valid_length?(1, 20, index) || !self.class.valid_format?(/^([a-zA-z]{3}|[0-9]{3})-?([a-zA-z]{2}|[0-9]{2})$/, index)
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
