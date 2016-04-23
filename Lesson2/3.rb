# 3. Заполнить массив числами фибоначи до 100
arr = [1,1]
all_nums = (1..100).to_a


while arr.max <= 100
	first_number = arr[arr.length - 1]
	second_number = arr[arr.length - 2]
	summ = first_number + second_number
	if summ >= 100
		break	
	end
	arr.push(summ)
end

p arr