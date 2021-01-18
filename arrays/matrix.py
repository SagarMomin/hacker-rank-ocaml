#!/bin/python3

import math
import os
import random
import re
import sys

# Complete the hourglassSum function below.
def valid_bounds(x,y):
  return x >= 0 and x +2 < 6 and y >= 0 and y +2 < 6
import sys

def hourglassSum(arr):
  max_hourglass = -sys.maxsize -1 
  for y, row in enumerate(arr):
    for x, cell in enumerate(row):
      if (valid_bounds(x, y)):
        hourglass = ( 0
        + arr[y + 0][x + 0]
        + arr[y + 0][x + 1]
        + arr[y + 0][x + 2]
        + arr[y + 1][x + 1]
        + arr[y + 2][x + 0]
        + arr[y + 2][x + 1]
        + arr[y + 2][x + 2])
        max_hourglass = max(max_hourglass, hourglass)
  return max_hourglass
        
if __name__ == '__main__':

    arr = []

    for _ in range(6):
        arr.append(list(map(int, input().rstrip().split())))

    result = hourglassSum(arr)
    print(result)



