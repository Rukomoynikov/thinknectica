require 'rspec'
require_relative '../train'
require_relative '../route'
require_relative '../station'

moskva = Station.new("Москва")
bolshevo = Station.new("Болшево")

oktyabrskaya_doroga = Route.new(moskva, bolshevo)

oktyabrskaya_doroga.add_station(Station.new("Москва-3"))
oktyabrskaya_doroga.add_station(Station.new("Мытищи"))
oktyabrskaya_doroga.add_station(Station.new("Подлипки"))

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
    train.add_speed(20)
    expect(train.speed).to eq(20)
  end

  it 'может снижать скорость' do
    train.reduce_speed(10)
    expect(train.speed).to eq(10)
  end

  it 'может тормозить' do
    train.stop
    expect(train.speed).to eq(0)
  end

  it 'может цеплять новые вагоны' do
    train.add_carriage(5)
    expect(train.carriage_count).to eq(10)
  end

  it 'может отцеплять вагоны' do
    train.remove_carriage(5)
    expect(train.carriage_count).to eq(5)
  end

  it 'оперирует вагонами только если полностью остановился' do
    train.add_speed
    expect(train.speed).to eq(10)
    train.add_carriage(5)
    expect(train.carriage_count).to eq(5)
  end

  it 'может принимать маршрут следования' do
    train.route = oktyabrskaya_doroga
    expect(train.route).to be_instance_of(Route)
  end
end
