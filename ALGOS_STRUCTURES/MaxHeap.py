class BinMaxHeap:
    def __init__(self, maxSize = 16):
        self.H = [0]* (maxSize + 1)
        self.maxSize = maxSize
        self.size = 0
    def Parent(self, i):
        return i//2
    def LeftChild(self, i):
        return 2*i
    def RightChild(self, i):
        return 2*i + 1
    def SiftUp(self, i):
        while i > 1 and self.H[self.Parent(i)] < self.H[i]:
            tmp = self.H[self.Parent(i)]
            self.H[self.Parent(i)] = self.H[i]
            self.H[i] = tmp
            i = self.Parent(i)
    def SiftDown(self, i):
        maxI = i
        l = self.LeftChild(i)
        r = self.RightChild(i)
        if l <= self.size and self.H[l] > self.H[maxI]:
            maxI = l
        if r <= self.size and self.H[r] > self.H[maxI]:
            maxI = r
        if i != maxI:
            tmp = self.H[maxI]
            self.H[maxI] = self.H[i]
            self.H[i] = tmp
            self.SiftDown(maxI)
    def Insert(self, p):
        if self.size == self.maxSize:
            return 'error'
        self.size += 1
        self.H[self.size] = p
        self.SiftUp(self.size)
    def ExtractMax(self):
        result = self.H[1]
        self.H[1] = self.H[self.size]
        self.H[self.size] = 0
        self.size -= 1
        self.SiftDown(1)
        return result
    def Remove(self, i):
        self.H[i] = self.H[1] + 100
        self.SiftUp(i)
        r = self.ExtractMax()
    def ChangePriority(self, i, p):
        old_p = self.H[i]
        self.H[i] = p
        if old_p < p:
            self.SiftUp(i)
        else:
            self.SiftDown(i)


heap = BinMaxHeap(12)
heap.Insert(42)
heap.Insert(29)
heap.Insert(18)
heap.Insert(7)
heap.Insert(13)
heap.Insert(18)
heap.Insert(12)
heap.Insert(11)
heap.Insert(14)
heap.Remove(3)
print(heap.H)
heap.ChangePriority(6, 35)
print(heap.H)
