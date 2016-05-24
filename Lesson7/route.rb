require('./station.rb')
require './modules/validator'

class Route
  extend Validator
  attr_accessor :first_station, :last_station, :stations

  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @stations = [@first_station, @last_station]
    validate!
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def remove_station(station)
    stations.delete(station)
  end

  def to_s
    p "Информация о маршруте"
    p '---------------------'
    stations.each do |station|
      p "Станция - #{station.name}"
      unless station.trains.empty?
        station.map_trains do |train|
          p "Поезд номер #{train.index}, тип #{train.class::TYPE_NAME}, количество вагонов #{train.carriages.length}"
          train.map_carriages {|carriage, _index| carriage.to_s}
        end
      end
      p '>>>>>>>>>>'
    end
  end

  def valid?
    validate!
  rescue
    false
  end

  private

  def validate!
    self.class.valid_instance?('Station', @first_station)
    self.class.valid_instance?('Station', @last_station)
    @stations.each { |station| raise 'Station is not type of station' unless self.class.valid_instance?('Station', station) }
    true
  end
end
