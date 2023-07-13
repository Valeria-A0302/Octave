function G = chol2(A)
%Вход - А - симметричная положительно определённая NxN матрица
%Выход - G - матрица размера NxN, элементы G(i, j) при i >= j которой 
%орбазуют матрицу из разложения Холецкого A = GG'
[N N] = size(A);
for k = 1:N
  A(k,k) = sqrt(A(k,k));
  A(k+1:N,k) = A(k+1:N,k) / A(k, k);
  for j = k+1:N
    A(j:N,j) = A(j:N,j) - A(j:N,k)*A(j,k);
  endfor
endfor
G = A;
end