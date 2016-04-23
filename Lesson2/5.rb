# 5. Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя). Найти порядковый номер даты, начиная отсчет с начала года. Учесть, что год может быть високосным. (Запрещено использовать встроенные в ruby методы для этого вроде Date#yday или Date#leap?) Алгоритм опредления високосного года: www.adm.yar.ru

# Год високосный, если он делится на четыре без остатка, но если он делится на 100 без остатка, это не високосный год. Однако, если он делится без остатка на 400, это високосный год. Таким образом, 2000 г. является особым високосным годом, который бывает лишь раз в 400 лет.
date = Hash.new

loop do
	p "Дата:"
	date[:day] = gets.chomp.to_i

	p "Месяц:"
	date[:month] = gets.chomp.to_i

	p "Год:"
	date[:year] = gets.chomp.to_i
	break if date[:year] > 0 && date[:month] > 0 && date[:day] > 0
end

def is_year_leap(year)
	if (year % 4)
		if (year % 100 == 0 && year % 400 == 0)
			return true
		elsif (year % 100 == 0)
			return false
		else 
			return true
		end
	else
		return false
	end
end

months = {
	january: 31,
	february: is_year_leap(date[:year]) ? 29 : 28,
	march: 31,
	april: 30,
	may: 31,
	june: 30,
	july: 31,
	august: 31,
	september: 30,
	october: 31,
	november: 30,
	december: 31
}

def day_number (months, date)
	selected_months = months.to_a.slice(0, (date[:month] - 1))
	summ_of_days = 0 
	selected_months.map { |e| summ_of_days += e[1]}
	summ_of_days += date[:day]
end

p day_number(months, date)