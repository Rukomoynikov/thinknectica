p 'Get your name: '
name = gets.chomp

p 'Get your height: '
height = gets.chomp.to_i

ideal_weight = height - 110

if ideal_weight >= 0
	p "#{name} ваш идеальный вес #{height - ideal_weight}"
else
	p "#{name} у вас уже идеальный вес"
end