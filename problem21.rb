# Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
# If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.

# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

# Evaluate the sum of all the amicable numbers under 10000.
# ANSWER = 31626
###############################################################################

# Identify the genetic makeup of a specified integer (i.e. get all the proper divisors).  
# Use "flatten" to create a one-dimensional array of all the results.  Use "compact" to remove any "nil" results.
# TEST = puts "all mating_algorithm for 28 = #{mating_algorithm(28)}"
# LARGE NUMBER TEST = puts "number of mating_algorithm for 10,000,000,000 = #{mating_algorithm(10000000000).length}"
def mating_algorithm(value)
	d = (1..Math.sqrt(value).floor).collect { |i| [i, value/i] if ((value/i) * i) == value }.flatten.compact
	d.reject! { |n| n == value }
end

# Find out if these stupid numbers can be used to produce suitable offspring for the colony.  Or are destined to tear each other's 
# throats out in a bloody melee that will no doubt cause catastrophic damaage to the ship that is carrying our specimens to their
# new colony.
def we_were_fucking_MADE_for_each_other?(first, second)
	return false if first.nil? || second.nil?
	first == second
end

# Force the poor integer to find out if he/she has any potential mates.  It's like match.com, but with desperate
# integers instead of desperate people.  If we find that our subject *DOES* have a potential breeding ideal_partner_genetic_code, get
# him/her and his/her buddy and add them to the collection of intellectually elite integers.  These integers will be
# granted permission to board the colony ship and start a race of superior integers.  BigInt, you'd best be wary...
# Hooray eugenics!
def eugenics_program(candidate)
	candidate_genetic_code = mating_algorithm(candidate).reduce(:+) #284
	ideal_partner_genetic_code = mating_algorithm(candidate_genetic_code).reduce(:+) #220

	# Can't mate with yourself, buddy (and produce offspring, anyway)....
	return if candidate_genetic_code == ideal_partner_genetic_code

	return candidate_genetic_code, ideal_partner_genetic_code if we_were_fucking_MADE_for_each_other?(ideal_partner_genetic_code, candidate)
end

genetic_code_of_all_colonists = (220...10000).collect { |i| eugenics_program(i) }.flatten.compact.uniq.reduce(:+)
puts "result: #{genetic_code_of_all_colonists}"

# RUN 'EM, BOYS!!!!!!!
# --------------------------
start_time = Time.now

colonists = (220...10000).collect { |i| eugenics_program(i) }.flatten.compact.uniq.reduce(:+)

puts "result: #{colonists}"
puts "Elapsed time: #{Time.now - start_time} seconds."