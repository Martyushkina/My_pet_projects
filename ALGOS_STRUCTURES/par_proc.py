#параллельная обработка задач n процессорами
def SiftDown(A, i):
        minI = i
        l = 2*i + 1
        r = 2*i + 2
        if l <= len(A) - 1 and A[l] < A[minI]:
            minI = l
        if r <= len(A) - 1 and A[r] < A[minI]:
            minI = r
        if i != minI:
            tmp = A[minI]
            A[minI] = A[i]
            A[i] = tmp
            SiftDown(A, minI)
            
      
def buildHeap(n):
    heap = []
    for i in range(n):
        heap.append([0, i])
    return heap

    
n, m = list(map(int, input().split()))
A = list(map(int, input().split()))
heap = buildHeap(n)
for a in A:
    print(heap[0][1], heap[0][0])
    heap[0][0] += a
    SiftDown(heap, 0)

