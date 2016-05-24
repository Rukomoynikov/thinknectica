class Train
  attr_accessor :speed, :route, :index, :type, :carriage_count, :station_index

  def initialize(index, type, carriage_count)
    @index = index
    @type = type
    @carriage_count = carriage_count
    @speed = 0
    @station_index = 0
  end

  def add_speed(speed = 10)
    self.speed += speed
  end

  def reduce_speed(speed = 10)
    self.speed -= speed
  end

  def stop
    self.speed = 0
  end

  def add_carriage(count = 1)
    self.carriage_count += count if self.speed == 0
  end

  def remove_carriage(count = 1)
    self.carriage_count -= count if self.speed == 0
  end

  def move_forward
    @route.stations.at(@station_index).send_train(self)
    self.station_index += 1
    @route.stations.at(@station_index).receive_train(self)
  end

  def move_backward
    @route.stations.at(@station_index).send_train(self)
    self.station_index -= 1
    @route.stations.at(@station_index).receive_train(self)
  end

  def show_station(type)
    if type = 'previous'
      @route.stations.at(@station_index - 1).receive_train(self)
    elsif type == 'next'
      @route.stations.at(@station_index + 1).receive_train(self)
    elsif type == 'current'
      @route.stations.at(@station_index).receive_train(self)
    end
  end
end
