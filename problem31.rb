# In England the currency is made up of pound, £, and pence, p, and there are eight coins in general circulation:
#
# 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
# It is possible to make £2 in the following way:
#
# 1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p
# How many different ways can £2 be made using any number of coins?
#
# ANSWER: 73682
###############################################################################

##########################
# PRACTICE
##########################
def recsum(x)
	return x if x == 1
	return x + recsum(x - 1)
end

puts recsum(5)

def tailrecsum(x, total=0)
	return total if x == 0
	return tailrecsum(x - 1, total + x)
end

puts tailrecsum(5)

def arr_tailrec(arr, total = 0)
	first, *rest = arr
	#puts "first = #{first}, rest = #{rest}"
	return total + first if rest.length == 0
	return arr_tailrec(rest, total + first)
end

a = [1,2, 3, 4, 5]

puts arr_tailrec(a)

##########################
# END PRACTICE
##########################

#SOLVE
start_time = Time.now

coins = [1, 2, 5, 10, 20, 50, 100, 200]

def count_combinations(coins, amount)
	return 1 if amount == 0
	return 0 if amount < 0 || coins.length == 0

	# Cool trick I learned from here: http://devblog.avdi.org/2010/01/31/first-and-rest-in-ruby/
	coin_value, *other_coins = coins
	balance = amount - coin_value

	return count_combinations(coins, balance) + count_combinations(other_coins, amount)
end

puts "answer = #{count_combinations(coins, 200)}"
puts "elapsed time = #{Time.now - start_time} seconds."