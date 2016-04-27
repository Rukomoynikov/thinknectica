require 'rspec'
require_relative '../Train'

describe 'Поезд' do
  train = Train.new("Поезд1", "грузовой", 5)
  # it 'может быть создан' do
  #   expect(Train.new("Поезд1", "грузовой", 5).class).to be(Train)
  # end

  it 'имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов' do
    expect(train.index).to eq("Поезд1")
    expect(train.type).to eq("грузовой")
    expect(train.carriage_count).to eq(5)
  end

  it 'может набирать скорость' do
    train.add_speed(10)
    expect(train.speed).to eq(10)
  end

end