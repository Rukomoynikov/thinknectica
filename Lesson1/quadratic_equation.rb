p "Введите коэффициент a"
a = gets.chomp.to_f

p "Введите коэффициент b"
b = gets.chomp.to_f

p "Введите коэффициент c"
c = gets.chomp.to_f

p "Уравнение имеет вид: #{a}x^2 + #{b}x + c = 0"

D = b * b - 4 * a * c

if D < 0
  p "Дискриминант #{D}"
elsif D == 0
  p "Решение имеет один корень - #{-b / 2 * a}"
else
  C = Math.sqrt(D)
  p C
  p b
  x1 = (-b + C) / (2 * a)
  x2 = (-b - C) / (2 * a)
  p "Решение имеет два корня x1 = #{x1.round 2} и x2 = #{x2.round 2}"
end
