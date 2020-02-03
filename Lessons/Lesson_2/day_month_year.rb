=begin5. Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя). Найти порядковый номер даты, начиная отсчет с начала года. Учесть, что год может быть високосным. (Запрещено использовать встроенные в ruby методы для этого вроде Date#yday или Date#leap?) Алгоритм опредления високосного года: www.adm.yar.ru
=end
print 'Введите день:'
user_day = gets.chomp.to_i
print 'Введите месяц:'
user_month = gets.chomp.to_i
print 'Введите год:'
user_year = gets.chomp.to_i

month_days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

def leap_year?(year)
  (year % 4 == 0 && year % 100 != 0) || year % 400 == 0
end

month_days[1] = 29 if leap_year?(user_year)

date_counter = user_day + month_days.take(user_month - 1).reduce(0, :+)

puts "Порядковый номер даты: #{date_counter}"
