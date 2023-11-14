import sys
          
sys.setrecursionlimit(10 ** 6)   

#여러개의 input시, input().split() -> map, int 써서 타입 캐스팅
n, m, r = map(int, sys.stdin.readline().rstrip().split())
#list의 초깃값 -> 아래처럼 [] * 개수
visited = [False] * (n+1) #방문 여부 확인 list
visit_info = [[] for _ in range(n+1)]
for _ in range(0,m):
    vertexStart, vertexEnd = map(int,sys.stdin.readline().rstrip().split())
    visit_info[vertexStart].append(vertexEnd)
    visit_info[vertexEnd].append(vertexStart)

for arr in visit_info:
    arr = arr.sort()
#dfs(V, E, R) {  # V : 정점 집합, E : 간선 집합, R : 시작 정점
def dfs(point):
    visited[point] = True
    print(point)
    for node in visit_info[point]:
        if (visited[node] == False):
            dfs(node)


dfs(r)
    
for i in range(1,n+1):
    if visited[i] == False:
        print(0)

