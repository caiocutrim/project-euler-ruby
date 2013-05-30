# A VERY basic implementation of the Euclidian GCD algorithm:
# http://en.wikipedia.org/wiki/Euclidean_algorithm
 def gcd_jj(a, b)
 	while b != 0 # keep dividing while there is a remainder
 		remainder = a % b
 		a = b
 		b = remainder
 	end

 	return a
 end

def gcd_recurse(a, b)
	if b == 0
		return a
	else
		return gcd_recurse(b, a % b)
	end
end

# # Got the equation from http://rosettacode.org/wiki/Least_common_multiple,
# # which was pretty simple to convert.
 def lcm_jj(a, b)
 	a * b / gcd_recurse(a, b)
 end

nums = (11..20).to_a
agg = 0
nums.each do |i|
	agg = lcm_jj(i, nums[i + 1])
end

puts agg
# Quit your jibber-jabber and run it!
#puts (1..20).to_a.reduce(:lcm)

puts "GCD of 2 and 4: #{gcd_jj(2, 4)}"
puts "GCD of 9 and 15: #{gcd_jj(9, 15)}"

puts "GCD of 2 and 4 RECURSIVE: #{gcd_recurse(2, 4)}"
puts "GCD of 9 and 15 RECURSIVE: #{gcd_recurse(9, 15)}"

# puts "LCM of 3 and 5: #{lcm(3, 5)}"
# puts "LCM of 4 and 5: #{lcm(4, 5)}"

