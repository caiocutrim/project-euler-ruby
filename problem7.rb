# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
#
# What is the 10 001st prime number?
###############################################################################
# Basic trial division to determine if n is a prime number.
def prime_number?(n)
	(2..Math.sqrt(n).floor).each { |i| return false if n % i == 0 }  
	true
end

# Extend the Integer class to include basic trial division as a method called
# "is_a_prime_number?"
class Integer < Numeric
	def is_a_prime_number?
		(2..Math.sqrt(self).floor).each { |i| return false if self % i == 0 }  
		true
	end
end

# Trieal division test:
# 100.times do |i|
# 	puts "#{i} is prime? #{prime_number?(i)}"
# end

i = 3 # start at 3.  If we start at 2, the loop goes on forever.
count = 1 # start count at 1, since 2 is the first prime.
start_time = Time.now

until count == 10001
	count += 1 if i.is_a_prime_number?
	break if count == 10001
	i += 2 # skip even numbers, we know all even numbers are composite
end 

puts "10001st prime = #{i}"
puts "Elapsed time: #{ Time.now - start_time } seconds"

# "checksum"
require 'prime'
puts Prime.take(10001).last