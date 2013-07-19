# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
#
# a^2 + b^2 = c^2
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 52.
#
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.
###############################################################################
# From http://en.wikipedia.org/wiki/Pythagorean_triple
def generate_triple(m, n)
	a = (m ** 2) - (n ** 2)
	b = 2 * m * n
	c = m ** 2 + n ** 2

	return a, b, c
end

# puts generate_triple(2, 1)

# Totally naive, brute-force method to find the 3 values...
100.times do |i|
	i.times do |j|
		x, y, z = generate_triple(i, j)
		if x + y + z == 1000
			puts "x = #{x}, y = #{y}, z = #{z}"
			puts "x * y * z = #{x * y * z}"
			break
		end
	end 
end

# Output:
# x = 375, y = 200, z = 425
# x * y * z = 31875000

#(m2+1)2 = (m2-1)2 + (2m)2

# def plato_eq(m)
# 	m_squared = m ** 2
# 	c = (m_squared + 1) ** 2
# 	a = (m_squared - 1) ** 2
# 	b = (2 * m) ** 2

# 	puts "a = #{a}, b = #{b}, c = #{c}"
# 	puts "a + b + c = #{a + b + c}"
# 	puts "#{a ** 2} + #{b ** 2} = #{c ** 2}"
# end

# puts plato_eq(5)