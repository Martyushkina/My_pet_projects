#симуляция телефонной книги
n = int(input())

pb = dict()
recs = []
for i in range(n):
    com = input().split()
    if com[0] == 'add':
        pb.update({int(com[1]): com[2]})
    elif com[0] == 'find':
        if int(com[1]) in pb:
            recs.append(pb.get(int(com[1])))
        else:
            recs.append('not found')    
    elif com[0] == 'del':
        if int(com[1]) in pb:
            x = pb.pop(int(com[1]))

for i in recs:
    print(i)

