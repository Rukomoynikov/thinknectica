require './train'
require './train_cargo'
require './train_passenger'
require './station'
require './route'
require './carriage'

moskva = Station.new("Москва")
bolshevo = Station.new("Болешво")

oktyabrskaya_doroga = Route.new(moskva, bolshevo)

oktyabrskaya_doroga.add_station(Station.new("Москва-3"))
oktyabrskaya_doroga.add_station(Station.new("Мытищи"))
oktyabrskaya_doroga.add_station(Station.new("Подлипки"))

train1 = TrainCargo.new('3PIO')
train2 = TrainPassenger.new("Тысячелетний сокол")
train1.set_route(oktyabrskaya_doroga)
train2.set_route(oktyabrskaya_doroga)

train1.add_carriage(CargoCarriage.new('Apple'))
train1.add_carriage(CargoCarriage.new('Apple'))
train1.add_carriage(PassengerCarriage.new('ZIL Factory'))
train1.move_forward
