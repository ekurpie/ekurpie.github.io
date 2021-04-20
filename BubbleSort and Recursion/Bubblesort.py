# Evan Kurpiewski


def bubble_sort(numList):
    """
    This is a bubble sort function. However, in comparison to usual bubble sort, it sorts in a reverse sort of manner.
    It does this by bubbling down smaller numbers from right to left rather than large numbers from left to right.
    :param numList:
    :return:
    """

    for i in range(len(numList)-1):  # outer loop going from left to right for the whole list
        for j in range(len(numList)-1, i, -1):  # inner loop going from right to left down to i, the position of the outer loop
            if numList[j] < numList[j - 1]:  # compares j and j-1 and swaps if j-1 is larger
                numList[j], numList[j-1] = numList[j-1], numList[j]  # swapping j and j-1 if it meets condition


# Main function

if __name__ == '__main__':

    # Open file for reading -- hardcoded to numbers.txt
    input_file = open("numbers.txt", "r")

    # create an empty list named NumList
    numList = []

    # This is for clarity
    print("Evaluating file numbers.txt")

    # for each line in the file, append the line to the list as an integer
    for line in input_file.readlines():
        numList.append(int(line))

    # open a second file for writing as the output
    output = open("numbers_sorted.txt", "w")

    # perform the bubble sort function on the list and print for clarity
    print("Bubble sorting numbers.txt ... wait one moment")
    bubble_sort(numList)

    # for each element of numList write that value as a string followed by a newline character so that each value
    # ends up on a new line.
    print("Creating new list with sorted numbers from numbers.txt called numbers_sorted.txt")
    for i in numList:
        output.write((str(i) + "\n"))

    # Close both files that we had opened.
    print("Closing Files")
    input_file.close()
    output.close()
