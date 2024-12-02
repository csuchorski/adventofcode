#%%
left = []
right = []
with open("input1.txt", "r") as f:
    lines = f.readlines()

for line in lines:
    a, b = line.split()
    left.append(int(a))
    right.append(int(b))
left.sort()
right.sort()
res = 0
for i in range(len(left)):
    res += abs(left[i] - right[i])

print(res)
