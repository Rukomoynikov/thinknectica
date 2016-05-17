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

oktyabrskaya_doroga = Route.new(moskva, bolshevo)

oktyabrskaya_doroga.add_station(Station.new("Москва-3"))
oktyabrskaya_doroga.add_station(Station.new("Мытищи"))
oktyabrskaya_doroga.add_station(Station.new("Подлипки"))

# train1 = TrainCargo.new("3PIO")
# train2 = TrainPassenger.new("Тысячелетний сокол")
train1 = TrainCargo.new("111-11")
train2 = TrainPassenger.new("AAA-aa")
train1.set_route(oktyabrskaya_doroga)
train2.set_route(oktyabrskaya_doroga)

train1.add_carriage(CargoCarriage.new("Apple"))
train1.add_carriage(CargoCarriage.new("Apple"))
train1.add_carriage(PassengerCarriage.new("ZIL Factory"))
# train1.move_forward

p "Panel for creating train:"
p "-------------------------"
p ""
begin 
	p "Name your train"
	name = gets.chomp
	p "Type your train - (C) Cargo or (P) Passenger"
	type = gets.chomp
	raise if type !~ /C|P/
	if (type == "C")
		p TrainCargo.new(name)
	else
		p TrainPassenger.new(name)
	end
rescue
	p "You know for creating train you have to name it and give a type"
	p "Do you wish to continue? (Y/N)"
	retry if gets.chomp.to_s == "Y"
end