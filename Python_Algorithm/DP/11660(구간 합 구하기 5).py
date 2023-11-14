import sys

N, M = map(int, sys.stdin.readline().rstrip("\n").split(" "))


input_arr = []

cumulative_sum = [[0] * (N+1) for i in range(N+1)]

for i in range(N):
    input_arr.append(list(map(int, sys.stdin.readline().rstrip("\n").split(" "))))
    
for i in range(1,N+1):
    for j in range(1,N+1):
        cumulative_sum[i][j] = cumulative_sum[i-1][j] + cumulative_sum[i][j-1] - cumulative_sum[i-1][j-1] + input_arr[i-1][j-1]
        
for i in range(M):
    x1, y1, x2, y2 = map(int,sys.stdin.readline().rstrip("\n").split(" "))
    print(cumulative_sum[x2][y2] - cumulative_sum[x2][y1-1] - cumulative_sum[x1-1][y2] + cumulative_sum[x1-1][y1-1])