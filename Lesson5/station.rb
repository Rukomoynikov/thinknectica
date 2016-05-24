class Station
  attr_accessor :name, :trains

  def self.all
    p @@stations_list.to_s
  end

  @@stations_list = []
  def initialize(name)
    @@stations_list << self
    @name = name
    @trains = []
  end

  def receive_train(train)
    @trains << train
    p "Поезд #{train.index} прибыл на платформу #{name}"
  end

  def send_train(train)
    @trains.delete(train)
    p "Поезд #{train.index} убыл c платформы #{name}"
  end

  def trains_list(type)
    p "На станции #{name} всего #{trains.length} поездов."
    p '-------------------------------------------------------'
    if type
      p "Типа #{type.capitalize} на станции всего"
      @trains.map do |train|
        p "Поезд #{train.index} типа #{train.type}" if train.type == type
      end
    else
      @trains.map do |train|
        p "Поезд #{train.index} типа #{train.type}"
      end
    end
  end
end
