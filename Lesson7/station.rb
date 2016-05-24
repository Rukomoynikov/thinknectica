require './modules/validator'
require './train'

class Station
  extend Validator
  attr_accessor :name, :trains

  def self.all
    p @@stations_list.to_s
  end

  @@stations_list = []
  def initialize(name)
    @name = name
    @@stations_list << self
    @trains = []
    validate!
  end

  def receive_train(train)
    @trains << train
    p "Поезд #{train.index} прибыл на платформу #{name}"
  end

  def send_train(train)
    @trains.delete(train)
    p "Поезд #{train.index} убыл c платформы #{name}"
  end

  def trains_list(type = nil)
    p "На станции #{name} всего #{trains.length} поездов."
    p '-------------------------------------------------------'
    if !type.nil?
      p "Типа #{type.capitalize} на станции всего"
      @trains.map do |train|
        p "Поезд #{train.index} типа #{train::TYPE_NAME}"
      end
    else
      @trains.map do |train|
        p "Поезд #{train.index} типа #{train}"
      end
    end
  end

  def map_trains
    # block.call(@trains[0])
    # @trains.each do |train|
    # 	return block.call(train)
    # 	# В этом месте я не понял, если не делать return то выводится полная информация о поезде.
    # end
    @trains.each { |train| return yield train }
  end

  def valid?
    validate!
  rescue
    false
  end

  private

  def validate!
    raise "Name for station #{self} is not valid" unless self.class.valid_length?(1, 10, @name)
  end
end
