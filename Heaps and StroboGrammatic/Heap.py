
class BinHeap:
    def __init__(self):
        self.heapList = [0]
        self.currentSize = 0

    def heapify(self, i):
        l = self.left(i)
        r = self.right(i)
        if l <= self.currentSize and self.heapList[l] > self.heapList[i]:
            largest = l
        else:
            largest = i
        if r <= self.currentSize and self.heapList[r] > self.heapList[largest]:
            largest = r
        if self.heapList[largest] != self.heapList[i]:
            self.heapList[i], self.heapList[largest] = self.heapList[largest], self.heapList[i]
            self.heapify(largest)

    def delMax(self):
        retval = self.heapList[1]
        self.heapList[1] = self.heapList[self.currentSize]
        self.currentSize = self.currentSize - 1
        self.heapList.pop()
        self.heapify(1)
        return retval

    def buildHeap(self, alist):
        self.currentSize = len(alist)
        self.heapList = [0] + alist[:]
        i = len(alist) // 2
        while (i > 0):
            self.heapify(i)
            i = i - 1

    def parent(self, i):
        return i//2

    def left(self, i):
        return 2*i

    def right(self, i):
        return 2*i + 1

    def heapSort(self):
        for i in range(len(self.heapList)-1, 1, -1):
            self.heapList[1], self.heapList[i] = self.heapList[i], self.heapList[1]
            self.currentSize = self.currentSize - 1
            self.heapify(1)


my_heap = BinHeap()
my_heap.buildHeap([0, 10, 5, 2, 7,11,6])


print("the current heap has the values:", my_heap.heapList)

print(my_heap.delMax(), "deleted")

print("the current heap has the values:", my_heap.heapList)

my_heap.heapSort()

print("sorted:", my_heap.heapList)

# expected output:
# the current heap has the the values: [0, 11, 10, 6, 2, 7, 5, 0]
# 11 deleted
# the current heap has the the values: [0, 10, 7, 6, 2, 0, 5]
# sorted: [0, 0, 2, 5, 6, 7, 10]