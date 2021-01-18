#!/bin/python3

import math
import os
import random
import re
import sys

from functools import reduce


def countingValleys(steps, path):
    def f(height_valleys, direction):
        height, valleys = height_valleys
        if direction == 'D':
            return (height - 1, valleys)
        elif direction == 'U':
            height += 1
            valleys = valleys + 1 if height == 0 else valleys
            return (height, valleys)
        else:
            raise

    return reduce(f, path, (0, 0))[1]


if __name__ == '__main__':
    steps = int(input().strip())
    path = input()
    result = countingValleys(steps, path)

    print(str(result))
