function x = gause_simple (A, b, n)
  A = [A b];
 
 for i = 1: n - 1
    for j = i + 1: n
      m = A(j, i) / A(i, i);
      for k = i: n
        A(j, k) = A(j, k) - m*A(i, k);
      endfor
    endfor
  endfor

x = ones(n, 1);
 for i =1: n
   for j = i + 1: n
   a = sum(A(i, j) .* x(n, 1));
 endfor
 x(i, 1) = (b(i, 1) - sum(A(i, j) .* x(n, 1))) / A(i, j);
 endfor
 endfunction