n = 1000;
b = 153
X = rand(n);
A = X' * X;
tic;
G1 = chol1(A, b);
toc;
G2 = chol(A);

