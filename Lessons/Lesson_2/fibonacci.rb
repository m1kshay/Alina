#3. Заполнить массив числами фибоначчи до 100
array = [0, 1]
while (new_number = array[-2] + array[-1]) <= 100
  array << new_number
end
puts array.to_s
