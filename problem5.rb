# A VERY basic implementation of the Euclidian GCD algorithm:
# http://en.wikipedia.org/wiki/Euclidean_algorithm
def gcd(a, b)
	while b != 0 # keep dividing while there is a remainder
		remainder = a % b
		a = b
		b = remainder
	end

	return a
end

# Got the equation from http://rosettacode.org/wiki/Least_common_multiple,
# which was pretty simple to convert.
def lcm(a, b)
	a * b / gcd(a, b)
end

# Quit your jibber-jabber and run it!
nums = (1..20).to_a
puts nums.reduce(:lcm)

# puts "GCD of 2 and 4: #{gcd(2, 4)}"
# puts "GCD of 9 and 15: #{gcd(3, 15)}"

# puts "LCM of 3 and 5: #{lcm(3, 5)}"
# puts "LCM of 4 and 5: #{lcm(4, 5)}"

