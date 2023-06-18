#сортировка массива с помощью мин-кучи
def SiftDown(A, i, swaps):
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
            swaps.append(str(i) + ' ' + str(minI))
            SiftDown(A, minI, swaps)
      
def buildHeap(A):
    size = len(A)
    swaps = []
    for i in range(size//2, -1, -1):
        SiftDown(A, i, swaps)
    print(len(swaps))
    for j in swaps:
        print(j)

    
n = int(input())
A = list(map(int, input().split()))
buildHeap(A)
