sum_of_squares = (1..100).to_a.reduce(0) { |agg, i| agg += i ** 2 }
square_of_sums = (1..100).to_a.reduce(0) { |agg, i| agg += i } ** 2

puts "sum_of_squares = #{sum_of_squares}"
puts "square_of_sums = #{square_of_sums}"
puts "difference = #{square_of_sums - sum_of_squares}"