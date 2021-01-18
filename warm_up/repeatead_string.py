#!/bin/python3

import math
import os
import random
import re
import sys

from functools import reduce, partial


# Complete the repeatedString function below.
def repeatedString(s, n):
    s_length = len(s)

    def count_number_of_as(s):
        return reduce(lambda acc, c: acc + 1 if c == 'a' else acc, s, 0)

    def count_remainder(s):
        remainder = n % s_length
        return count_number_of_as(s[0:remainder])

    chars_per_length = count_number_of_as(s)
    chars_leftover = count_remainder(s)

    return (int(n / s_length) * chars_per_length + chars_leftover)


if __name__ == '__main__':
    s = input()
    n = int(input())

    result = repeatedString(s, n)

    print(str(result))
