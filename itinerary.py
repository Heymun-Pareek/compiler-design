
tickets = [["MUC","LHR"], ["JFK","MUC"],
           ["SFO","SJC"], ["LHR","SFO"]]

graph = {}

# Create graph
for a, b in tickets:
    if a not in graph:
        graph[a] = []
    graph[a].append(b)

# Sort destinations
for a in graph:
    graph[a].sort(reverse=True)

ans = []

def dfs(city):
    while city in graph and graph[city]:
        next = graph[city].pop()
        dfs(next)

    ans.append(city)

dfs("JFK")

print(ans[::-1])
