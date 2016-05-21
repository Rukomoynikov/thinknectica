require "./train"
require "./train_cargo"
require "./train_passenger"
require "./station"
require "./route"
require './carriage'

require './modules/validator'
# mode = ""
#
# p "Панель управления"
# while mode == ""
#   p "Выберите необходимое действие:"
#   p "(1) Создать новую станцию"
#   p "(2) Создать новую дорогу"
#
#   mode = gets.chomp.to_i
# end

moskva = Station.new("Москва")
bolshevo = Station.new("Болешво")

moskva3 = Station.new("Москва-3")
mytishi = Station.new("Мытищи")
podlipki = Station.new("Подлипки")

oktyabrskaya_doroga = Route.new(moskva, bolshevo)

oktyabrskaya_doroga.add_station(moskva3)
oktyabrskaya_doroga.add_station(mytishi)
oktyabrskaya_doroga.add_station(podlipki)

train1 = TrainCargo.new("111-11")
train2 = TrainPassenger.new("AAA-aa")
train1.set_route(oktyabrskaya_doroga)
train2.set_route(oktyabrskaya_doroga)

train1.add_carriage(CargoCarriage.new("Apple", 20))
train1.add_carriage(CargoCarriage.new("IBM", 25))
train1.add_carriage(PassengerCarriage.new("ZIL Factory", 100))
train1.move_forward

p "---------------------------"
p "---------------------------"
p "---------------------------"

oktyabrskaya_doroga.to_s
# p "Panel for creating train:"
# p "-------------------------"
# p ""
# begin
# 	p "Name your train"
# 	name = gets.chomp
# 	p "Type your train - (C) Cargo or (P) Passenger"
# 	type = gets.chomp
# 	raise if type !~ /C|P/
# 	if (type == "C")
# 		p TrainCargo.new(name)
# 	else
# 		p TrainPassenger.new(name)
# 	end
# rescue
# 	p "You know for creating train you have to name it and give a type"
# 	p "Do you wish to continue? (Y/N)"
# 	retry if gets.chomp.to_s == "Y"
# end
