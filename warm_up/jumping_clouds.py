#!/bin/python3

import math
import os
import random
import re
import sys

from functools import reduce


# Complete the jumpingOnClouds function below.
def jumpingOnClouds(c):
    def f(acc, enumerable):
        i, cloud = enumerable

        if cloud == 0:
            if len(acc) >= 2 and acc[-2] == i - 2:
                return acc[:-1] + [i]
            else:
                return acc + [i]
        else:
            return acc

    return (len(reduce(f, enumerate(c), [])) - 1)


if __name__ == '__main__':
    n = int(input())
    c = list(map(int, input().rstrip().split()))
    result = jumpingOnClouds(c)

    print(str(result))
