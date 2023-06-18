class BinMinHeap:
    def __init__(self, maxSize = 16):
        self.H = [0]* maxSize
        self.maxSize = maxSize
        self.size = 0
    def Parent(self, i):
        return (i - 1)//2
    def LeftChild(self, i):
        return 2*i + 1
    def RightChild(self, i):
        return 2*i + 2
    def SiftUp(self, i):
        while i > 0 and self.H[self.Parent(i)] > self.H[i]:
            tmp = self.H[self.Parent(i)]
            self.H[self.Parent(i)] = self.H[i]
            self.H[i] = tmp
            i = self.Parent(i)
    def SiftDown(self, i):
        minI = i
        l = self.LeftChild(i)
        r = self.RightChild(i)
        
        if l <= self.size - 1 and self.H[l] < self.H[minI]:
            minI = l
        if r <= self.size - 1 and self.H[r] < self.H[minI]:
            minI = r
        if i != minI:
            tmp = self.H[minI]
            self.H[minI] = self.H[i]
            self.H[i] = tmp
            self.SiftDown(minI)
    def Insert(self, p):
        if self.size == self.maxSize:
            return 'error'
        self.size += 1
        self.H[self.size - 1] = p
        self.SiftUp(self.size - 1)
    def ExtractMin(self):
        result = self.H[0]
        self.H[0] = self.H[self.size - 1]
        self.H[self.size - 1] = 0
        self.size -= 1
        self.SiftDown(0)
        return result
    def Remove(self, i):
        self.H[i] = self.H[0] - 100
        self.SiftUp(i)
        r = self.ExtractMin()
    def ChangePriority(self, i, p):
        old_p = self.H[i]
        self.H[i] = p
        if old_p > p:
            self.SiftUp(i)
        else:
            self.SiftDown(i)


heap = BinMinHeap(12)
heap.Insert(42)
heap.Insert(29)
heap.Insert(18)
heap.Insert(7)
heap.Insert(13)
heap.Insert(18)
heap.Insert(12)
heap.Insert(11)
heap.Insert(14)
print(heap.H)
heap.Remove(3)
print(heap.H)
heap.ChangePriority(2, 35)
print(heap.H)
