# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
#
# Find the largest palindrome made from the product of two 3-digit numbers.
#
# palindromes = []
###############################################################################
100.upto(999) do |i|
	i.upto(999) do |j|
		result = i * j
		palindromes << result if result.to_s == result.to_s.reverse
	end
end

puts palindromes.sort.last