# If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
#
# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?
#
#
# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.
#
# ANSWER:  21124
###############################################################################
# Extend the Integer class to include a "to_words" method and the private methods that support it.
class Integer < Numeric
	# Translate an integer to its English representation.
	# TESTS
	# 	0.upto(99).map { |i| puts "#{i}: #{i.to_words}" }
	# 	100.upto(999).map { |i| puts "#{i}: #{i.to_words}" }
	# 	puts "1000: #{1000.to_words}"
	# 	1111.to_words
	def to_words
		raise "Can only get words for numbers 0 - 1000." if self > 1000

		s = self.abs.to_s

		build_map

		return "one thousand" if self == 1000

		return get_0_through_99(s) if (0..99).include?(self)

		get_100_through_999(s)
	end

	private 

		def get_0_through_99(n)
			return @map[n] if (0..19).include?(self) || n[1] == "0"

			tens = @map["#{n[0]}0"]
			ones = @map[n[1]]

		 	"#{tens}-#{ones}"
		end

		def get_100_through_999(n)
			return "#{@map[n[0]]} hundred" if n[1] == "0" && n[2] == "0"

			tens_and_ones = n[1..2].to_i.to_words
			"#{@map[n[0]]} hundred and #{tens_and_ones}"
		end

		def build_map
			@map = {
				"0" => "zero",
				"1" => "one", 
				"2" => "two",
				"3" => "three",
				"4" => "four",
				"5" => "five",
				"6" => "six",
				"7" => "seven",
				"8" => "eight",
				"9" => "nine",
				"10" => "ten",
				"11" => "eleven",
				"12" => "twelve",
				"13" => "thirteen",
				"14" => "fourteen",
				"15" => "fifteen",
				"16" => "sixteen",
				"17" => "seventeen",
				"18" => "eighteen",
				"19" => "nineteen",
				"20" => "twenty",
				"30" => "thirty",
				"40" => "forty",
				"50" => "fifty",
				"60" => "sixty",
				"70" => "seventy",
				"80" => "eighty",
				"90" => "ninety"
			}
		end
end

#SOLVE
start_time = Time.now
result = (1..1000).reduce("") { |chars, i| chars << i.to_words }.gsub(" ", "").gsub("-", "").length
puts "answer = #{result}"
puts "elapsed time = #{Time.now - start_time}"