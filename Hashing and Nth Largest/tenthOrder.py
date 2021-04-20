import math
import statistics
import random

def tenthOrder(A, ith = 10):
    """
    This function returns the tenth order statistic from a list. It was created with the idea that a linear time
    median function could be used instead of the statistics.median as statistics.median creates substantial problems.
    :param A:
    :param ith:
    :return:
    """
    if len(A) <= 5:
        B = sorted(A)
        return B[ith - 1]

    pivot = int(statistics.median(A))
    q = 0
    dif = float("inf")
    for i in range(len(A)):
        if abs(pivot - A[i]) < dif:
            dif = abs(pivot - A[i])
            q = i
    pivot = A[q]
    A[q], A[0] = A[0], A[q]
    leftmark = 1
    rightmark = len(A)-1
    while True:
        while leftmark <= rightmark and A[leftmark] <= pivot:
            leftmark = leftmark + 1
        while leftmark <= rightmark and A[rightmark] >= pivot:
            rightmark = rightmark - 1
        if leftmark <= rightmark:
            A[leftmark], A[rightmark] = A[rightmark], A[leftmark]
        else:
            break
    A[0], A[rightmark] = A[rightmark], A[0]
    if ith > rightmark:
        return tenthOrder(A[rightmark+1:],ith - rightmark - 1)
    else:
        return tenthOrder(A[:rightmark],ith)

lst = []

for i in range(30):
    lst.append(random.randint(0,1000))

print(lst)
print(tenthOrder(lst))
b =sorted(lst)
print(b)
print(b[9])

