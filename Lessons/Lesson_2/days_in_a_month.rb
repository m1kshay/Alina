# 1. Сделать хеш, содеращий месяцы и количество дней в месяце. В цикле выводить те месяцы, у которых количество дней ровно 30
year = {
  Jan: 31, 
  Feb: 28, 
  Mar: 31, 
  Apr: 30, 
  May: 31, 
  Jun: 30, 
  Jul: 31, 
  Aug: 31, 
  Sep: 30, 
  Oct: 31, 
  Nov: 30, 
  Dec: 31
}
year.each do |month, days|
  puts "#{month} have #{days} days" if days == 30
end