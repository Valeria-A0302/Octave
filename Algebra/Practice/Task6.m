#1
n = 5;
X = zeros(n, n);
for i = 1: n
  for k = 1: n
    if i == k
      X(k, k) = k;
    else
      X(i, k) = 1;
    end
  end
end
X;
A = X' * X
#2
H1 = chol(A);
H2 = chol2(A);
#3

