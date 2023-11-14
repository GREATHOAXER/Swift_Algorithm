import sys

n = int(sys.stdin.readline().rstrip("\n"))

print("CY" if n%2 == 0 else "SK")