#реализация бинарного дерева для обхода In - order, Post - order, Pre - order
class Node:
    def __init__(self, v):
        self.key = v
        
    def v_parent(self, parent):
        self.parent = parent

    def v_children(self, v1, v2):
        self.left = v1
        self.right = v2
        
    def inorder(self, tree):
        if self.left != None:
            self.left.inorder(tree)
        tree.append(self.key)
        if self.right != None:
            self.right.inorder(tree)
        return tree
    def preorder(self, tree):
        tree.append(self.key)
        if self.left != None:
            self.left.preorder(tree)
        if self.right != None:
            self.right.preorder(tree)
        return tree
    def postorder(self, tree):
        if self.left != None:
            self.left.postorder(tree)
        if self.right != None:
            self.right.postorder(tree)
        tree.append(self.key)
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

tree = nodes[0].inorder([])
print(' '.join(list(map(str, tree))))
tree = nodes[0].preorder([])
print(' '.join(list(map(str, tree))))
tree = nodes[0].postorder([])
print(' '.join(list(map(str, tree))))
    
        
