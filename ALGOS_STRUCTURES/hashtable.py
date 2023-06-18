#реализация хеширования цепочками
def make_hash(text):
    x = 263
    p = 10**9 + 7
    hf = 0
    for i in range(len(text)):
        hf += (ord(text[i])*x**i) % p
    hf = hf % p
    return hf
        
        


m = int(input())
table = []
for i in range(m):
    table.append([])

n = int(input())
recs = []
for i in range(n):
    com = input().split()
    
    if com[0] == 'add':
        hf = make_hash(com[1]) % m
        if len(table[hf]) != 0:
            if com[1] not in table[hf]:
                table[hf].insert(0, com[1])
        else:
            table[hf].append(com[1])
                
    elif com[0] == 'del':
        hf = make_hash(com[1]) % m
        if len(table[hf]) != 0:
            if com[1] in table[hf]:
                table[hf].remove(com[1])
                
    elif com[0] == 'find':
        hf = make_hash(com[1]) % m
        if len(table[hf]) != 0:
            if com[1] in table[hf]:
                recs.append('yes')
            else:
                recs.append('no')
        else:
            recs.append('no')
    
    elif com[0] == 'check':
        if len(table[int(com[1])]) != 0:
            recs.append(' '.join(table[int(com[1])]))
        else:
            recs.append('')


for i in recs:
    print(i)

        
