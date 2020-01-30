#Идеальный вес. Программа запрашивает у пользователя имя и рост и выводит идеальный вес по формуле (<рост> - 110) * 1.15, после чего выводит результат пользователю на экран с обращением по имени. Если идеальный вес получается отрицательным, то выводится строка "Ваш вес уже оптимальный"
puts 'What is your name?'
first_name = gets.chomp
first_name2 = first_name.capitalize!
puts 'How tall are you?'
tall = gets.chomp.to_i
ideal_weight = ((tall - 110) * 1.15).round(0)
if ideal_weight < 0
  puts 'Your weight optimal already'
else
  puts "#{first_name}, your ideal weight is #{ideal_weight} kg"
end
