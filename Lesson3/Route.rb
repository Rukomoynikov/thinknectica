# Класс Route (Маршрут):
# Имеет начальную и конечную станцию, а также список промежуточных станций. Начальная и конечная станции указываютсся при создании маршрута, а промежуточные могут добавляться между ними.
# Может добавлять промежуточную станцию в список
# Может удалять промежуточную станцию из списка
# Может выводить список всех станций по-порядку от начальной до конечной

class Route
  attr_accessor :first_station, :last_station, :stations

  def initialize(first_station, last_station)
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

  attr_reader :stations

  def to_s
    p "Информиация о маршруте"
    p '--------------'
    p "Первая станция #{@first_station.name}"
    stations.each { |station| p "Промежуточная станция #{station.name}" }
    "Последняя станция #{@last_station.name}"
  end
end
