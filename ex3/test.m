x1 = [-3 , -1, 1, 4];
y1 = [-4, -2, 0, -2];

x = [-1, 0, 1, 3, 4];
y = [5, 3, 3, 9, 15];

# c = interpNewton(x, y)

# function v = Horner(c, x, z)
# 5 * 1   -2 * (x - (-1))    + 1 * (x - (-1))(x - 0)
v = Horner([5, -2, 1, 0], [-1, 0, 1, 3], [-1, 0, 1, 3, 10])
# dobry out: [5, 3, 3, 9, 93]
