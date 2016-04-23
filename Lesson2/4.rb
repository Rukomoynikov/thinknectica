# 4. Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).

alphabet = ("A"..."Z").to_a
hash = Hash.new()

alphabet.each_with_index{ |letter,index| 
	hash[index + 1] = letter if ["A", "E", "I", "O", "U", "Y"].member?(letter)
}