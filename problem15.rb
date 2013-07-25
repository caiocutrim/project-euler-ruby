# Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.
#
# How many such routes are there through a 20×20 grid?
#
# ANSWER = 137846528820
###############################################################################
def factorial(n)
	return 1 if n == 1
	return n * factorial(n - 1)
end

start_time = Time.now
# Assumption:  The grid is a square, so the number of rows and number of 
# columns are the same
grid_size = 20

# Started here: http://www.robertdickau.com/lattices.html
# Found equation here:  http://www.robertdickau.com/manhattan.html
possible_paths = factorial(2 * grid_size) / (factorial(grid_size)) ** 2

puts "answer = #{possible_paths}"
puts "elapsed time = #{Time.now - start_time} seconds."