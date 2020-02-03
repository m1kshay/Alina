#3. Заполнить массив числами фибоначчи до 100
array = [0, 1]
while
	array[-2] + array[-1] <= 100
  array << array[-2] + array[-1]
end
puts array.to_s