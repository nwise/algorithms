def binary_search(list, item):
    low = 0
    high = len(list)-1
    guesses = 0

    while low <= high:
        guesses += 1
        mid = (low + high) / 2
        guess = list[mid]
        if guess == item:
            print "Guesses: %s" % guesses
            return mid
        if guess > item:
            high = mid - 1
        else:
            low = mid + 1
    print "Guesses: %s" % guesses
    return None

my_list = [] #[1,3,5,7,9,10,11,12,13,14,15]
for x in range(0, 100000000):
    my_list.append(x)

print binary_search(my_list, 99999999)
