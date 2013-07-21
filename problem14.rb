# The following iterative sequence is defined for the set of positive integers:
#
# n → n/2 (n is even)
# n → 3n + 1 (n is odd)
#
# Using the rule above and starting with 13, we generate the following sequence:
#
# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
#
# Which starting number, under one million, produces the longest chain?
#
# NOTE: Once the chain starts the terms are allowed to go above one million.
#
# ANSWER:  Answer = 837799, Number of Steps = 525
###############################################################################

# Find out how many steps it takes to reduce n to 1 using the rules for 
# generating the Collatz sequence.
#
# http://hbfs.wordpress.com/2012/05/01/faster-collatz/:
# "So if an odd number always yield an even number; we might combine two steps into one 
# if x is odd: x=(3x+1)/2 (and increment the counter twice). 
# If x is even, we could divide repeatedly by 2 until we arrive at an odd number (and incrementing the counter once per iteration). "
# 
# TEST: puts count_collatz_sequence_steps(13) # => 10, Elapsed Time = 4.9e-05 seconds.
# LARGE NUMBER TEST: puts count_collatz_sequence_steps(1000000000) # => 101, Elapsed Time = 1.7e-05 seconds.
start_time = Time.now
def count_collatz_sequence_steps(n)
	steps = 1
	return steps if n < 1

	until n == 1
		while n.odd? do 
			n = (3 * n + 1)/2
			steps += 2 
		end

		while n.even? do 
			n = n/2
			steps += 1 
		end
	end

	steps 
end

# SOLVE
result, steps = 0, 0

999999.times do |i|
	number_of_steps = count_collatz_sequence_steps(i)
	
	result = i and steps = number_of_steps if number_of_steps > steps
end

puts "Answer = #{result}, Number of Steps = #{steps}"
puts "Elapsed Time = #{Time.now - start_time} seconds."