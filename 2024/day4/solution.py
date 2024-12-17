#%%
with open("input.txt", "r") as f:
    lines = [line.strip() for line in f.readlines()] 

def get_diagonals(matrix):
    diagonals = []
    n, m = len(matrix), len(matrix[0])
    
    for d in range(n + m - 1):
        diag1, diag2 = [], []
        for i in range(max(0, d - m + 1), min(n, d + 1)):
            diag1.append(matrix[i][d - i])
            diag2.append(matrix[i][m - 1 - (d - i)])
        diagonals.append(''.join(diag1))
        diagonals.append(''.join(diag2))
    
    return diagonals

xmas_count = 0

for line in lines:
    xmas_count += line.count('XMAS')
    xmas_count += ''.join(reversed(line)).count('XMAS')


transposed_lines = [''.join(line) for line in zip(*lines)]

for line in transposed_lines:
    xmas_count += line.count('XMAS')
    xmas_count += ''.join(reversed(line)).count('XMAS')

matrix = [list(line) for line in lines]
diagonals = get_diagonals(matrix)

for line in diagonals:
    xmas_count += line.count('XMAS')
    xmas_count += ''.join(reversed(line)).count('XMAS')

print(xmas_count)
