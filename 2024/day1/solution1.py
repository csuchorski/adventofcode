#%%
# left = []
# right = []
# with open("input1.txt", "r") as f:
#     lines = f.readlines()

# for line in lines:
#     a, b = line.split()
#     left.append(int(a))
#     right.append(int(b))
# left.sort()
# right.sort()
# res = 0
# for i in range(len(left)):
#     res += abs(left[i] - right[i])

# print(res)

from collections import defaultdict

left = []
right_count = defaultdict(int)
res = 0

with open("input1.txt", "r") as f:
    lines = f.readlines()

for line in lines:
    a, b = line.split()
    left.append(int(a))
    right_count[int(b)] += 1

for num in left:
    res += num * right_count[num]

print(res)