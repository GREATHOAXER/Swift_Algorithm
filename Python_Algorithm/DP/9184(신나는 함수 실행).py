"""
이거 DP 문제인데, 함수만 만들어서 실행하면은 시간초과가 나서 
내려갈때마다 일일이 DP형태로 값을 저장해서 문제 풀어보면됨
"""
import sys

def w(a: int, b: int, c: int):
    if (a <= 0 or b <= 0 or c <= 0):
        return 1    
                
    elif (a > 20 or b > 20 or c > 20):
        return w(20,20,20)
    
    if dp[a][b][c] != 0:
        return dp[a][b][c]
    
    if (a < b and b < c):
        dp[a][b][c] = w(a,b,c-1) + w(a,b-1,c-1) - w(a,b-1,c)
        return dp[a][b][c]
    
    else:
        dp[a][b][c] = w(a-1,b,c) + w(a-1,b-1,c) + w(a-1,b,c-1) - w(a-1,b-1,c-1)
        return dp[a][b][c]
    

dp = [[[0]* 21 for i in range(21)] for i in range(21)]



while True:
    a,b,c = map(int, sys.stdin.readline().rstrip("\n").split(" "))
    
    if (a == -1 and b == -1 and c == -1):
        break
    #포메팅 기억하기
    print("w({a}, {b}, {c}) = {result}".format(a = a, b = b, c = c, result = w(a,b,c)))


