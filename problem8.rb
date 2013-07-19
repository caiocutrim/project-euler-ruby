# Find the greatest product of five consecutive digits in the 1000-digit number.
###############################################################################
num = %Q{73167176531330624919225119674426574742355349194934
96983520312774506326239578318016984801869478851843
85861560789112949495459501737958331952853208805511
12540698747158523863050715693290963295227443043557
66896648950445244523161731856403098711121722383113
62229893423380308135336276614282806444486645238749
30358907296290491560440772390713810515859307960866
70172427121883998797908792274921901699720888093776
65727333001053367881220235421809751254540594752243
52584907711670556013604839586446706324415722155397
53697817977846174064955149290862569321978468622482
83972241375657056057490261407972968652414535100474
82166370484403199890008895243450658541227588666881
16427171479924442928230863465674813919123162824586
17866458359124566529476545682848912883142607690042
24219022671055626321111109370544217506941658960408
07198403850962455444362981230987879927244284909188
84580156166097919133875499200524063689912560717606
05886116467109405077541002256983155200055935729725
71636269561882670428252483600823257530420752963450}.gsub(/\n/, "").gsub(/\r/, "")

#--------------------------------------------------------------------------------
# FIRST ATTEMPT
# Using a loop to go through each digit and grab a group of 5 consecutive digits
# and multiply them together.
#--------------------------------------------------------------------------------
start_time = Time.now

digits = num.split('')
result = 0

0.upto(digits.length) do |x|
	five_digit_group = digits.slice(x, 5)

	product = five_digit_group[0].to_i * five_digit_group[1].to_i * five_digit_group[2].to_i * five_digit_group[3].to_i * five_digit_group[4].to_i
	result = product if product > result
end

puts "first attempt: #{result}"
puts "elapsed time = #{Time.now - start_time} seconds."

# OUTPUT
# first attempt: 40824
# elapsed time = 0.00145 seconds.

#--------------------------------------------------------------------------------
# SECOND ATTEMPT * FASTER *
# use "shift" to remove the first element of the "digits" array, then always
# multiply the first 5 elements in the array.
#--------------------------------------------------------------------------------
start_time = Time.now

digits = num.split('')
result = 0

while digits.length > 0
	product = digits[0].to_i * digits[1].to_i * digits[2].to_i * digits[3].to_i * digits[4].to_i
	result = product if product > result

	digits.shift
end

puts "second attempt: #{result}"
puts "elapsed time = #{Time.now - start_time} seconds"


#--------------------------------------------------------------------------------
# THIRD ATTEMPT * FASTEST *
# Start at the end of the array and go backwards towards the beginning of the 
# collection of numbers.  Use "pop" to remove items from the end of the array of
# digits.  This should be better than "shift", because "shift" has to re-index
# the elements in the array after removing the first element.
#--------------------------------------------------------------------------------
start_time = Time.now

digits = num.split('').map { |n| n.to_i }
result = 0

while digits.length > 4
	product = digits[-1] * digits[-2] * digits[-3] * digits[-4] * digits[-5]
	result = product if product > result

	digits.pop
end

puts "result: #{result}"
puts "elapsed time = #{Time.now - start_time} seconds"


#OUTPUT
# second attempt: 40824
# elapsed time = 0.001268 seconds