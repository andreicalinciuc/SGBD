import sys

V = 9
graph = [[0 for column in range(V)] for row in range(V)] 

def minDistance(V, dist, sptSet):
    min = sys.maxint
    for v in range(V):
        if dist[v] < min and sptSet[v] == False: 
            min = dist[v] 
            min_index = v
    return min_index

def dijkstra(V, src):
    global graph
    dist = [sys.maxint] * V
    dist[src] = 0
    sptSet = [False] * V
    for cout in range(V):
        u = minDistance(V, dist, sptSet)
        sptSet[u] = True
        for v in range(V):
            if graph[u][v] > 0 and sptSet[v] == False and \
            dist[v] > dist[u] + graph[u][v]:
                dist[v] = dist[u] + graph[u][v]
    printSolution(dist)

graph =   [[0, 4, 0, 0, 0, 0, 0, 8, 0], 
           [4, 0, 8, 0, 0, 0, 0, 11, 0], 
           [0, 8, 0, 7, 0, 4, 0, 0, 2], 
           [0, 0, 7, 0, 9, 14, 0, 0, 0], 
           [0, 0, 0, 9, 0, 10, 0, 0, 0], 
           [0, 0, 4, 14, 10, 0, 2, 0, 0], 
           [0, 0, 0, 0, 0, 2, 0, 1, 6], 
           [8, 11, 0, 0, 0, 0, 1, 0, 7], 
           [0, 0, 2, 0, 0, 0, 6, 7, 0]
          ]


def printSolution(dist):
    print "Vertex tDistance from Source"
    for node in range(V):
        print node,"t",dist[node]

dijkstra(V, 0)