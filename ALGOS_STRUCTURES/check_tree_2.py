#проверка более общего свойства дерева поиска: для любой вершины дерева
#её ключ больше всех ключей в левом поддереве данной вершины и
#меньше всех ключей в правом поддереве (или равен некоторым)
import sys
sys.setrecursionlimit(30000)
class Node:
    def __init__(self, v):
        self.key = v
        
    def v_parent(self, parent):
        self.parent = parent

    def v_children(self, v1, v2):
        self.left = v1
        self.right = v2
        
    def return_min(self):
        if self.left is not None:
            return self.left.return_min()
        if self.left is None and self.right is not None and self.parent.key <= self.key:
            return self.parent.key
        elif self.left is None and self.right is not None and self.parent.key > self.key:
            return self.right.return_min()
        elif self.left is None and self.right is None:
            return self.key
        
    def return_max(self):
        if self.right is not None:
            return self.right.return_max()
        if self.right is None and self.left is not None and self.parent.key > self.key:
            return self.parent.key
        elif self.right is None and self.left is not None and self.parent.key <= self.key:
            return self.left.return_max()
        elif self.left is None and self.right is None:
            return self.key
            

#min max !!!

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
    for node in nodes:

        if node.left is not None:
            maxkey = node.left.return_max()
            if maxkey >= node.key:
                k = 0
                break
        if node.right is not None:
            minkey = node.right.return_min()
            if minkey < node.key:
                k = 0
                break        
else:
    k = 1

if k == 1:
    print('CORRECT')
else:  
    print('INCORRECT')    
