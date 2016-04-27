require "./Train"
require "./Station"
require "./Route"

moskva = Station.new("Москва")
bolshevo = Station.new("Болешво")

oktyabrskaya_doroga = Route.new(moskva, bolshevo)

oktyabrskaya_doroga.add_station(Station.new("Москва-3"))
oktyabrskaya_doroga.add_station(Station.new("Мытищи"))
oktyabrskaya_doroga.add_station(Station.new("Подлипки"))

train1 = Train.new("3PIO", "грузовой", 5)
train2 = Train.new("Тысячелетний сокол", "пассажирский", 1)
train1.route = oktyabrskaya_doroga
train2.route = oktyabrskaya_doroga

train1.move_forward