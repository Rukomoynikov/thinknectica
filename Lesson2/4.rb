# 4. Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).

alphabet = ("A"..."Z").to_a
vowels = ["A", "E", "I", "O", "U", "Y"]
hash = {}

alphabet.each_with_index{ |letter,index|
	hash[index + 1] = letter if vowels.member?(letter)
}
