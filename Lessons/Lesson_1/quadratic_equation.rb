=begin Квадратное уравнение. Пользователь вводит 3 коэффициента a, b и с. Программа вычисляет дискриминант (D) и корни уравнения (x1 и x2, если они есть) и выводит значения дискриминанта и корней на экран. При этом возможны следующие варианты:
  Если D > 0, то выводим дискриминант и 2 корня
  Если D = 0, то выводим дискриминант и 1 корень (т.к. корни в этом случае равны)
  Если D < 0, то выводим дискриминант и сообщение "Корней нет"
Подсказка: Алгоритм решения с блок-схемой (www.bolshoyvopros.ru). Для вычисления квадратного корня, нужно использовать 
Math.sqrt
 Например,  
Math.sqrt(16)
  вернет 4, т.е. квадратный корень из 16.
=end
puts 'Введите a'
a = gets.chomp.to_f
puts 'Введите b'
b = gets.chomp.to_f
puts 'Введите c'
c = gets.chomp.to_f
d = b**b - 4 * a * c
sqrt_d = Math.sqrt(d)
if d > 0
  x1 = (- b - sqrt_d)/(2.0 * a).to_f
  x2 = (- b + sqrt_d)/(2.0 * a).to_f
  puts "Корни уравнения равны #{x1} и #{x2}"
elsif
  d == 0
  x = (-b)/(2.0 * a)
  puts "Дискриминант #{d}, корень уравнения равен #{x}"
else
  d < 0
  puts "#{d}, корней нет"
end





 