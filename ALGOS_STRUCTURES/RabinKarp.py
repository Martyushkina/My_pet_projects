#реализация алгоритма Карпа - Рабина
from random import randint

def make_hash(text, p, x):

    hf = 0
    for i in range(len(text)):
        hf += (ord(text[i])%p*pow(x, i, p)) % p
    hf = hf % p
    return hf
        
    
pattern = input()
absp = len(pattern)
if absp != 1:
    x = randint(1, absp - 1)
else:
    x = 1

text = input()
recs = []
hash_p = make_hash(pattern, absp, x)
h = make_hash(text[len(text) - absp:], absp, x)

if h == hash_p and text[len(text) - absp:] == pattern:
    recs.append(len(text) - absp)
for i in range(len(text) - absp - 1, -1, -1):
    h = ((h - ord(text[i + absp]) % absp *pow(x,(absp - 1), absp) % absp)*x % absp + ord(text[i]) % absp) % absp
    if h == hash_p and text[i : i + absp] == pattern:
        recs.append(i)


s = ''
for i in range(len(recs) - 1, -1, -1):
    s += str(recs[i]) + ' '
print(s)
