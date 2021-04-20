import random

def SelectionSort(a):
    """
    Selection sort algorithm.
    :param a:
    :return:
    """
    position = 0
    for i in range(len(a)):
        smallest = a[i]
        for b in range(len(a)-1,i,-1):
            if a[b] < smallest:
                smallest = a[b]
                position = b
        if smallest < a[i]:
            a[i],a[position] = a[position],a[i]


## these are for creating a list to sort
b = random.sample(range(-10000,10000),10)
print(b)
#sorting b and reprinting it to show that it is sorted
SelectionSort(b)
print(b)



#

def palindrome(n,lst=[],current_string = ""):
    """
    This function PRODUCES palindromes via recursion.
    :param n:
    :param lst:
    :param current_string:
    :return:
    """


    if len(current_string) == n:
        if current_string == current_string[::-1]:
            lst.append(current_string)


    else:
        palindrome(n,lst,current_string + "a")
        palindrome(n, lst, current_string + "b")
        palindrome(n, lst, current_string + "c")

    return lst


print(palindrome(5))