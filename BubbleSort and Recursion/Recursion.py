# Evan Kurpiewski



def build_and_find_binaries(current_str, target_len, current_len, one_counter, zero_counter):
    """
    This is a function that builds binaries out of an empty string. It has a number of parameters though namely only
    one of these parameters should be altered when calling the function which is target len. The other parameters
    are used as part of the recursion. The base case is when the current len equals (==) the target len. Then if the
    ones within the current_str are greater than the zeroes it prints the string. It does this using the one and zero
    counters within the parameters.
    :param current_str:
    :param target_len:
    :param current_len:
    :param one_counter:
    :param zero_counter:
    :return:
    """
    if current_len == target_len:  # Base case: when the current length == the target length
        if one_counter > zero_counter:  # if there are more ones than zeros, print the string
            print(current_str)
    else:  # if not base case: recursively call the function adding a 1 or zero to the string and respective counter
        build_and_find_binaries(current_str + "0", target_len, current_len + 1, one_counter, zero_counter + 1)
        build_and_find_binaries(current_str + "1", target_len, current_len + 1, one_counter + 1, zero_counter)


def build_and_find_binaries2(target_len=0, current_str="", current_len=0, one_counter=0, zero_counter=0):
    """
    This is a slight alteration to the previous function whereby all of the values have default settings and the first
    parameter is target_len. This enables the function to seem simpler by just calling the function with an integer
    in it. It will then print off the binaries with characters equal to the integer where the ones are greater than the
    zeroes.
    :param current_str:
    :param target_len:
    :param current_len:
    :param one_counter:
    :param zero_counter:
    :return:
    """
    if current_len == target_len:  # Base case: when the current length == the target length
        if one_counter > zero_counter:  # if there are more ones than zeros, print the string
            print(current_str)
    else:  # if not base case: recursively call the function adding a 1 or zero to the string and respective counter
        build_and_find_binaries2(target_len, current_str + "0", current_len + 1, one_counter, zero_counter + 1)
        build_and_find_binaries2(target_len, current_str + "1", current_len + 1, one_counter + 1, zero_counter)


if __name__ == '__main__':  # main function calling the first and second versions showing they are the same

    print("\nfirst function")

    build_and_find_binaries("",4,0,0,0)

    print("\nsecond function")

    build_and_find_binaries2(4)
