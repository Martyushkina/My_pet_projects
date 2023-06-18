#симуляция объединения непересекающихся множеств
def find_parent(parent, i):
    if i != parent[i]:
        parent[i] = find_parent(parent, parent[i])
    return parent[i]

def union(parent, r, dest, source, maxr):
    dest_id = find_parent(parent, dest)
    source_id = find_parent(parent, source)
    if dest_id == source_id:
        return maxr
    else:
        parent[source_id] = dest_id
        r[dest_id - 1] += r[source_id - 1]
        diff = r[source_id - 1]
        r[source_id - 1] = 0
        if maxr < r[dest_id - 1]:
            return r[dest_id - 1]
        else:
            return maxr

n, m = list(map(int, input().split()))
r = list(map(int, input().split()))
parent = [i for i in range(0, n + 1)]

recs = []
maxr = max(r)
for i in range(m):
    d, s = list(map(int, input().split()))

    newr = union(parent, r, d, s, maxr)
    recs.append(newr)
    maxr = newr

for i in recs:
    print(i)
    
    
