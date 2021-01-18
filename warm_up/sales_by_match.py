#!/bin/python3

import math
import os
import random
import re
import sys

from functools import reduce


# Complete the sockMerchant function below.
def sockMerchant(n, ar):
    def f(socks_dict, sock):
        if sock not in socks_dict:
            socks_dict[sock] = 1
        else:
            socks_dict[sock] += 1
        return socks_dict

    socks = reduce(f, ar, {})
    return reduce(lambda acc, number_of_socks: acc + int(number_of_socks / 2),
                  socks.values(), 0)


if __name__ == '__main__':
    n = int(input())
    ar = list(map(int, input().rstrip().split()))
    result = sockMerchant(n, ar)
    print(str(result) + '\n')
