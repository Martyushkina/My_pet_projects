#проверка свойства дерева поиска: для любой вершины дерева
#её ключ больше всех ключей в левом поддереве данной вершины и
#меньше всех ключей в правом поддереве
class Node:
    def __init__(self, v):
        self.key = v
        
    def v_parent(self, parent):
        self.parent = parent

    def v_children(self, v1, v2):
        self.left = v1
        self.right = v2
        
    def inorder(self, tree):
        if self.left != None and self.left.key < self.key:
            self.left.inorder(tree)
        elif self.left != None:
            tree.append(self.key * 10**9)
        tree.append(self.key)
        if self.right != None:
            self.right.inorder(tree)
        return tree


n = int(input())
parent = [0] * n
keys = [0] * n
left = [0] * n
right = [0] * n
nodes = []

for i in range(n):
    v = list(map(int, input().split()))
    keys[i] = v[0]
    left[i] = v[1]
    right[i] = v[2]
    if left[i] != -1:
        parent[left[i]] = i
    if right[i] != -1:
        parent[right[i]] = i

for j in range(n):
    v = Node(keys[j])
    nodes.append(v)
for j in range(len(nodes)):
    nodes[j].v_parent(nodes[parent[j]])
    if left[j] == -1:
        v1 = None
    else:
        v1 = nodes[left[j]]
    if right[j] == -1:
        v2 = None
    else:
        v2 = nodes[right[j]]
        
    nodes[j].v_children(v1, v2)
    

k = 1    
if nodes:
    tree = nodes[0].inorder([])
    for i in range(len(tree) - 1):
        if tree[i + 1] < tree[i]:
            k = 0
            break
else:
    k = 1

if k == 1:
    print('CORRECT')
else:
    print('INCORRECT')    
