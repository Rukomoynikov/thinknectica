# 6. Сумма покупок. Пользователь вводит поочередно название товара, цену за единицу и кол-во купленного товара (может быть нецелым числом). Пользователь может ввести произвольное кол-во товаров до тех пор, пока не введет "стоп" в качестве названия товара. На основе введенных данных требуетеся:
# Заполнить и вывести на экран хеш, ключами которого являются названия товаров, а значением - вложенный хеш, содержащий цену за единицу товара и кол-во купленного товара. Также вывести итоговую сумму за каждый товар.
# Вычислить и вывести на экран итоговую сумму всех покупок в "корзине".

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
