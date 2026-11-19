
# NFA transition table
nfa = [
    [{0, 1}, {2}],
    [set(), {2}],
    [set(), set()]
]

final = {2}

# DFA subsets and transition table
lazySet = [{0}]
dfa = []

i = 0

while i < len(lazySet):
    row = [-1, -1]

    for j in range(2):
        reachable = set()

        for s in lazySet[i]:
            reachable |= nfa[s][j]

        if reachable:
            if reachable not in lazySet:
                lazySet.append(reachable)

            row[j] = lazySet.index(reachable)

    dfa.append(row)
    i += 1

# Print DFA table
print("State\t a\t b")

for i in range(len(lazySet)):
    print(lazySet[i], "\t", dfa[i],
          "Final" if lazySet[i] & final else "")
