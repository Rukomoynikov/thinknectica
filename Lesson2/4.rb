alphabet = ('A'...'Z').to_a
vowels = %w(A E I O U Y)
hash = {}

alphabet.each_with_index do |letter, index|
  hash[index + 1] = letter if vowels.member?(letter)
end
