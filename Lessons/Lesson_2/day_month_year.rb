#5. Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя). Найти порядковый номер даты, начиная отсчет с начала года. Учесть, что год может быть високосным. (Запрещено использовать встроенные в ruby методы для этого вроде Date#yday или Date#leap?) Алгоритм опредления високосного года: www.adm.yar.ru

print 'Введите день:'
day = gets.chomp.to_i
print 'Введите месяц:'
month = gets.chomp.to_i
print 'Введите год:'
year = gets.chomp.to_i

days_in_months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
days_in_months[1] = 29 if year % 400 == 0 || (year % 4 == 0 && year % 100 != 0)

date = 0

days_in_months.each.with_index(1) do |date, index|
  if index < month
    date += date
  elsif index == month
    date += day
  end
end
puts "Порядковый номер даты: #{date}"
