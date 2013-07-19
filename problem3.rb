# The prime factors of 13195 are 5, 7, 13 and 29.
#
# What is the largest prime factor of the number 600851475143 ?
###############################################################################
puts "CHEATING - FOUND ON INTER-WEBS"
def prime_factors(n)
  return [] if n == 1
  factor = (2..n).find {|x| n % x == 0}
  [factor] + prime_factors(n / factor)
end

puts prime_factors(600851475143)

puts "EratosthenesGenerator:"
require 'prime'
primes = Prime::EratosthenesGenerator.new.take_while { |i| i <= 13195 }
puts primes.reduce { |factors, i| factors << factors[i] / i }

puts "prime_division:"
#require 'mathn'
puts 600851475143.prime_division.last[0]
