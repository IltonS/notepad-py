# Gerador de números primos
# Gera todos os números primos entre 0 e 100

import math

prime: int
i: int
sqrtp: int
notprime: bool

print('2')
print('3')

prime = 5

while prime < 100:
   sqrtp = math.trunc( math.sqrt(prime) + 1 )
   i = 1
   notprime = False
   while (i < sqrtp) and ( not notprime ):
      i += 2
      notprime = ( (prime%i) == 0)
   if (not notprime):
      print(prime)
   prime += 2