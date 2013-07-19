# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
#
# Find the sum of all the primes below two million.
###############################################################################

# Doesn't perform very well when given a large number (like the one for this problem)
def sieve_of_eratosthenes(max)
sieve = []
for i in 2 .. max
  sieve[i] = i
end

for i in 2 .. Math.sqrt(max)
  next unless sieve[i]
  (i*i).step(max, i) do |j|
    sieve.delete(sieve[j])
  end
end

end


puts sieve_of_eratosthenes(10).compact.join ' '

#p arr.reduce(0) { |i, sum| sum += i }

# This works, but it's cheating.
require 'prime'
puts Prime::EratosthenesGenerator.new.take_while { |i| i <= 2000000 }.reduce { |sum, i| sum += i }