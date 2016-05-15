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
    # @first_station = first_station if self.class.valid_instance?("Station", first_station)
    # @last_station = last_station if self.class.valid_instance?("Station", last_station)
    @first_station = first_station
    @last_station = last_station
    @stations = [@first_station, @last_station]
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def remove_station(station)
    # index = stations.find_index(station)
    stations.delete(station)
  end

  def to_s
    p "Информиация о маршруте"
    p "--------------"
    p "Первая станция #{@first_station.name}"
    stations.each{ |station| p "Промежуточная станция #{station.name}" }
    "Последняя станция #{@last_station.name}"
  end

  def valid?
    raise "First station in route is not valid" if !self.class.valid_instance?("Station", @first_station)
    raise "Last station in route is not valid" if !self.class.valid_instance?("Station", @last_station)
    @stations.each{ |station| raise "Station is not type of station" if station.class != "Station"}
    return true
  end

end