#проверка системы равенств и неравенств
def find_parent(parent, i):
    if i != parent[i]:
        parent[i] = find_parent(parent, parent[i])
    return parent[i]

def union(parent, dest, source):
    dest_id = find_parent(parent, dest)
    source_id = find_parent(parent, source)
    if dest_id == source_id and dest != source:
        return 
    else:
        parent[source_id] = dest_id
        

n, e, t = list(map(int, input().split()))
parent = [i for i in range(0, n + 1)]
recs = []

for i in range(e):
    d, s = list(map(int, input().split()))
    union(parent, d, s)

f = 1
for i in range(t):
    d, s = list(map(int, input().split()))
    if parent[d] == parent[s]:
        f = 0
print(f)
        
