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

months = [31, is_year_leap?(year) ? 29 : 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

def day_number(months, day, month, _year)
  selected_months = months[0, (month - 1)]
  summ_of_days = 0
  selected_months.each { |days_in_month| summ_of_days += days_in_month }
  summ_of_days += day
end

p day_number(months, day, month, year)
