cart = {}

loop do
  item_in_cart = {}
  p "Введите название товара"
  name = gets.chomp
  break if name == "стоп"

  p "Цена за единицу"
  item_in_cart[:price] = gets.chomp.to_f

  p "Количество купленного товара"
  item_in_cart[:count] = gets.chomp.to_f

  cart[name] = item_in_cart
end

summ = 0
cart.each do |key, item|
  p "#{key} в количестве #{item[:count]} общей стоимостью #{item[:count] * item[:price]}"
  summ += item[:count] * item[:price]
end
p '---------'
p "Общая стоимость товаров - #{summ}"
