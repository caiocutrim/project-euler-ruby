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

		get_one_thru_19_dictionary
		get_tens_dictionary

		return "one thousand" if self == 1000

		return get_1_through_99(s) if (0..99).include?(self)

		return get_100_through_999(s) if (100..999).include?(self)
	end

	private 

		def get_1_through_99(n)
			return "#{@tens['1']}" if self == 10
			return "#{@ones[n]}" if (0..19).include?(self)
			
			if (20..99).include?(self)
				return n[1] == "0" ? "#{@tens[n[0]]}" : "#{@tens[n[0]]}-#{@ones[n[1]]}" 
			end
		end

		def get_100_through_999(n)
			if n[1] == "0" && n[2] == "0"
				return "#{@ones[n[0]]} hundred"
			else
				tens_and_ones = n[1..2].to_i.to_words
				return "#{@ones[n[0]]} hundred and #{tens_and_ones}"
			end
		end

		def get_one_thru_19_dictionary
			@ones = {
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
				"11" => "eleven",
				"12" => "twelve",
				"13" => "thirteen",
				"14" => "fourteen",
				"15" => "fifteen",
				"16" => "sixteen",
				"17" => "seventeen",
				"18" => "eighteen",
				"19" => "nineteen"
			}
		end

		def get_tens_dictionary
			@tens = {
				"1" => "ten",
				"2" => "twenty",
				"3" => "thirty",
				"4" => "forty",
				"5" => "fifty",
				"6" => "sixty",
				"7" => "seventy",
				"8" => "eighty",
				"9" => "ninety"
			}
		end
end

#SOLVE
start_time = Time.now
result = (1..1000).reduce("") { |chars, i| chars << i.to_words }.gsub(" ", "").gsub("-", "").length
puts "answer = #{result}"
puts "elapsed time = #{Time.now - start_time}"