require('./station.rb')
require "./modules/validator"
# Класс Route (Маршрут):
# Имеет начальную и конечную станцию, а также список промежуточных станций. Начальная и конечная станции указываютсся при создании маршрута, а промежуточные могут добавляться между ними.
# Может добавлять промежуточную станцию в список
# Может удалять промежуточную станцию из списка
# Может выводить список всех станций по-порядку от начальной до конечной

class Route
  extend Validator
  attr_accessor :first_station, :last_station, :stations

  def initialize (first_station, last_station)
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
    p "---------------------"
    stations.each do |station|
    	p "Станция - #{station.name}"
    	if station.trains.length > 0
    		station.map_trains do |train|
    			p "Поезд номер #{train.index}, тип #{train.class::TYPE_NAME}, количество вагонов #{train.carriages.length}"
					train.map_carriages do |carriage, index|
						carriage.to_s
					end
    		end
    	end
  		p ">>>>>>>>>>"
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
    @stations.each{ |station| raise "Station is not type of station" if !self.class.valid_instance?('Station', station) }
    return true
  end

end
