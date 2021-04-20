
# A strobogrammatic number is a number whose numeral is rotationally symmetric,
# Given n = 2, return ['11', '88', '69', '96'].
# Given n = 3, return ['111', '818', '619', '916', '181', '888', '689', '986', '101', '808', '609', '906'].

def findStrobogrammaticByn(target_len):
    dictionary={'0':'0', '1':'1', '8':'8', '6':'9', '9':'6'}
    temp_length = target_len
    def assist_with_base_case(temp_length):
        lst=[]
        if temp_length == 0:
            return ['']
        elif temp_length == 1:
            return ['0','1', '8']
        for i in assist_with_base_case(temp_length-2):
            for key, value in dictionary.items():
                if target_len != temp_length or key != '0':
                    lst.append(key+i+value)
        return lst

    return assist_with_base_case(temp_length)


print(findStrobogrammaticByn(2))
print(findStrobogrammaticByn(3))

