require './train'

class TrainCargo < Train
  TYPE_NAME = "Грузовой".freeze
  def self.m
    p 'a'
  end
end
