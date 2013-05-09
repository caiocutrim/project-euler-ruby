#result = 3.upto(999).inject do |agg, i|
#	(i % 3 == 0 || i % 5 == 0) ? agg += i : agg
#end

puts 2.upto(999).reduce { |agg, i| (i % 3 == 0 || i % 5 == 0) ? agg += i : agg }