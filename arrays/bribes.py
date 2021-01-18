#!/bin/python3

import math
import os
import random
import re
import sys

from functools import reduce


# Complete the minimumBribes function below.
def minimumBribes(q):
    def f(bribes, enumerable):
        i, starting_place = enumerable
        place_in_line = i + 1

        if starting_place - place_in_line >= 3:
            raise

        best_place_in_line = max(0, starting_place - 2)
        if best_place_in_line < place_in_line:
            bribes_taken = reduce(
                lambda bribes, x: bribes + 1 if x > starting_place else bribes,
                q[best_place_in_line:place_in_line],
                0,
            )
            return bribes + bribes_taken
        else:
            return bribes

    return reduce(f, enumerate(q), 0)


if __name__ == '__main__':
    t = int(input())

    for t_itr in range(t):
        n = int(input())
        q = list(map(int, input().rstrip().split()))
        try:
            print(minimumBribes(q))
        except:
            print("Too chaotic")
