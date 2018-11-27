#!/usr/bin/env ruby

sm_primes=[3,13,37,73]
med_prime=97
big_prime=6863
huge_prime=105339
steps=Random.srand(big_prime*2)

while(steps>0)
  4.times{print((rand(20)+med_prime).chr)}
  steps=Random.srand(sm_primes.inject(:*))^huge_prime
end
