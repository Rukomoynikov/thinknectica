# 1. Сделать хеш, содеращий месяцы и количество дней в месяце. В цикле выводить те месяцы, у которых количество дней ровно 30

months = {
	january: 31,
	february: 28,
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

# for month in months
# 	days = month[1]
# 	p "#{month[0].to_s.capitalize} have #{days} days" if days == 30
# end

# p '------------------------'

# counter = 0;
# while counter < months.length
# 	key = months.keys[counter]
# 	days = months[key]
# 	p "#{key.capitalize} have #{days} days" if days == 30
# 	counter += 1
# end

# p '-------------------------'

months.each do |month, days|
	p "#{month.to_s.capitalize} have #{days} days" if days == 30
end
