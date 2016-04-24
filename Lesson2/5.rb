# 5. Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя). Найти порядковый номер даты, начиная отсчет с начала года. Учесть, что год может быть високосным. (Запрещено использовать встроенные в ruby методы для этого вроде Date#yday или Date#leap?) Алгоритм опредления високосного года: www.adm.yar.ru

# Год високосный, если он делится на четыре без остатка, но если он делится на 100 без остатка, это не високосный год. Однако, если он делится без остатка на 400, это високосный год. Таким образом, 2000 г. является особым високосным годом, который бывает лишь раз в 400 лет.
day = 0, month = 0, year = 0

loop do
	p "Дата:"
	day = gets.chomp.to_i

	p "Месяц:"
	month = gets.chomp.to_i

	p "Год:"
	year = gets.chomp.to_i
	break if day > 0 && month > 0 && year > 0
end

def is_year_leap?(year)
	year % 4 == 0 && (year % 400 == 0 || year % 100 != 0)
end

months = [31, is_year_leap?(year) ? 29 : 28, 31, 30, 31, 30, 31, 31, 30, 31, 30,31]

def day_number (months, day, month, year)
	selected_months = months[0, (month - 1)]
	summ_of_days = 0
	selected_months.each { |days_in_month| summ_of_days += days_in_month}
	summ_of_days += day
end

p day_number(months, day, month, year)
