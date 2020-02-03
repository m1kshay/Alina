#4. Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).
alphabet = ('a'..'z').to_a
vowels = ['a', 'e', 'i', 'o', 'u', 'y']
result = {}
alphabet.each.with_index(1) do |text, index|
  result[text] = index if vowels.include?(text)
end
puts result