//// hello word
print('hello')


//// math
print(5+5)


// basic for
for a in range(10):
    print(a)
	

//// primes 
from timeit import Timer
import math

def is_prime(n):
    """ totally naive implementation """
    if n <= 1:
        return False

    q = math.floor(math.sqrt(n))
    for i in range(2, q + 1):
        if (n % i == 0):
            return False
    return True


def count_primes(max_n):
    res = 0
    for i in range(2, max_n + 1):
        if is_prime(i):
            res += 1
    return res

def test():
    max_n = 1000000
    print(f'Number of primes between 0 and {max_n} = {count_primes(max_n)}')

def main():
    print(f'Elapsed time: {Timer(stmt=test).timeit(1)} secs')

if __name__ == '__main__':
    main()


//// delphi_is_prime

from timeit import Timer
from module_delphi import delphi_is_prime
import math

def is_prime(n):
    """ totally naive implementation """
    if n <= 1:
        return False

    q = math.floor(math.sqrt(n))
    for i in range(2, q + 1):
        if (n % i == 0):
            return False
    return True


def count_primes(max_n):
    res = 0
    for i in range(2, max_n + 1):
        if delphi_is_prime(i):
            res += 1
    return res

def test():
    max_n = 1000000
    print(f'Number of primes between 0 and {max_n} = {count_primes(max_n)}')

def main():
    print(f'Elapsed time: {Timer(stmt=test).timeit(1)} secs')

if __name__ == '__main__':
    main()



//// delphi_count_primes

from timeit import Timer
from module_delphi import delphi_count_primes
import math

def is_prime(n):
    """ totally naive implementation """
    if n <= 1:
        return False

    q = math.floor(math.sqrt(n))
    for i in range(2, q + 1):
        if (n % i == 0):
            return False
    return True


def count_primes(max_n):
    res = 0
    for i in range(2, max_n + 1):
        if is_prime(i):
            res += 1
    return res

def test():
    max_n = 1000000
    print(f'Number of primes between 0 and {max_n} = {delphi_count_primes(max_n)}')

def main():
    print(f'Elapsed time: {Timer(stmt=test).timeit(1)} secs')

if __name__ == '__main__':
    main()



//// delphi_functions

from timeit import Timer
from module_delphi import delphi_functions
import math

def is_prime(n):
    """ totally naive implementation """
    if n <= 1:
        return False

    q = math.floor(math.sqrt(n))
    for i in range(2, q + 1):
        if (n % i == 0):
            return False
    return True


def count_primes(max_n):
    res = 0
    for i in range(2, max_n + 1):
        if is_prime(i):
            res += 1
    return res

def test():
    max_n = 1000000
    print(f'Number of primes between 0 and {max_n} = {delphi_functions.count_primes(max_n)}')

def main():
    print(f'Elapsed time: {Timer(stmt=test).timeit(1)} secs')

if __name__ == '__main__':
    main()

