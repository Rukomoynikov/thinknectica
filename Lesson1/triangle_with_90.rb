p "Первая сторона треугольника:"
line1 = gets.chomp.to_i

p "Вторая сторона треугольника:"
line2 = gets.chomp.to_i

p "Третья сторона треугольника:"
line3 = gets.chomp.to_i

if line1 == line2 && line2 == line3 && line1 == line3
  p "Треугольник равнобедренный и равносторонний, но не прямоугольный."
end

sides = [line1, line2, line3].sort!
gipotenuza = sides.last

if gipotenuza * gipotenuza == sides[0] * sides[0] + sides[1] * sides[1]
  p "Треугольник имеет прямой угол"
  p "Квадрат гипотенузы #{gipotenuza * gipotenuza} равен сумме" \
    "квадратов катетов #{sides[0] * sides[0] + sides[1] * sides[1]}."
elsif sides[0] == sides[1]
  p "Этот треугольник хоть и не прямоугольный, но равнобедренный."
else
  p "Этот треугольник, не является прямоугольным или равнобедренным."
end
