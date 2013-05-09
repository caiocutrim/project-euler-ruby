#arr = (2..13195).to_a
#max = Math.sqrt(13195)
#idx = 0

#while arr[idx] < max do
#	prime = arr[idx]

#	(arr[idx+1]..arr.length).each do |j|
#		arr.delete_at(j) if arr[j] % prime == 0
#	end

#	idx += 1
#end

#puts arr

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
