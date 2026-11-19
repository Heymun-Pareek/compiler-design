
# CFG:
# S -> aBd
# B -> bc | b

def B(s, i):
    start = i

    # Try first production: B -> bc
    if s[i:i+2] == "bc":
        return i+2, "B -> bc"

    # Backtrack and try second production: B -> b
    i = start
    if s[i:i+1] == "b":
        return i+1, "B -> b"

    return -1, ""


def S(s, i):
    # Check first terminal: a
    if s[i:i+1] != "a":
        return False, []

    # Parse non-terminal B
    i, rule = B(s, i+1)

    if i == -1:
        return False, []

    # Check final terminal: d
    if s[i:i+1] == "d" and i+1 == len(s):
        return True, ["S -> aBd", rule]

    return False, []


# Test inputs
inputs = ["abcd", "abd", "abccd", "ad", "abc"]

for s in inputs:
    print("Input:", s)

    accepted, derivation = S(s, 0)

    if accepted:
        print("Derivation:")
        for rule in derivation:
            print(rule)
        print("Result: ACCEPTED")
    else:
        print("Result: REJECTED")

    print()
