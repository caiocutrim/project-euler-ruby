palindromes = []

100.upto(999) do |i|
	i.upto(999) do |j|
		result = i * j
		palindromes << result if result.to_s == result.to_s.reverse
	end
end

puts palindromes.sort.last