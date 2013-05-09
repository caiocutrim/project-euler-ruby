# fs = an array of the fibonacci sequence numbers
# i = the current number we're looking at
# [0, 1] = seed the "fs" array with 0 and 1, which the fibonacci sequence traditionally
# starts with.
f = ->(x){ x < 2 ? x : f[x-1] + f[x-2] }
puts f[32]

puts (0..100).reduce([0,1]) { |fs, i| (fs << fs[-1] + fs[-2] if fs[-1] + fs[-2] <= 4000000) || fs }
	   		 .reduce { |sum, i| sum += (i % 2  == 0 ? i : 0) }