# The sum of the squares of the first ten natural numbers is,
#
# 1^2 + 2^2 + ... + 10^2 = 385
# The square of the sum of the first ten natural numbers is,
#
# (1 + 2 + ... + 10)^2 = 55^2 = 3025
# Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.
#
# Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
#
# ANSWER:  sum_of_squares = 338350, 25502500, difference = 25164150
###############################################################################
sum_of_squares = (1..100).to_a.reduce(0) { |agg, i| agg += i ** 2 }
square_of_sums = (1..100).to_a.reduce(0) { |agg, i| agg += i } ** 2

puts "sum_of_squares = #{sum_of_squares}"
puts "square_of_sums = #{square_of_sums}"
puts "difference = #{square_of_sums - sum_of_squares}"