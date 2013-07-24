# n! means n × (n − 1) × ... × 3 × 2 × 1
#
# For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
# and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
#
# Find the sum of the digits in the number 100!
# 
# ANSWER = 648
###############################################################################
start_time = Time.now

def factorial(n)
	return 1 if n == 1
	return n * factorial(n - 1)
end

result = factorial(100).to_s.split("").map { |s| s.to_i }.reduce(:+)

puts "answer = #{result}"
puts "elapsed time = #{Time.now - start_time}"

