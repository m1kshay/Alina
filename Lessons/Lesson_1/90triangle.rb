#Прямоугольный треугольник. Программа запрашивает у пользователя 3 стороны треугольника и определяет, является ли треугольник прямоугольным (используя теорему Пифагора www-formula.ru), равнобедренным (т.е. у него равны любые 2 стороны)  или равносторонним (все 3 стороны равны) и выводит результат на экран. Подсказка: чтобы воспользоваться теоремой Пифагора, нужно сначала найти самую длинную сторону (гипотенуза) и сравнить ее значение в квадрате с суммой квадратов двух остальных сторон. Если все 3 стороны равны, то треугольник равнобедренный и равносторонний, но не прямоугольный.
puts 'Введите 3 стороны треугольника'
a = gets.chomp.to_i
b = gets.chomp.to_i
c = gets.chomp.to_i
a, b, h = [side_a, side_b, side_c].sort

if a**2 || b**2 || c**2 = a**2 + b**2 || a**2 + c**2 || b**2 + c**2
  puts 'Это прямоугольный треугольник'
elsif a = b || a = c || b = a || b = c || c = a || c = b
  puts 'Это равнобедренный треугольник'
else a = b = c
  puts 'Это равносторонний треугольник'
end

