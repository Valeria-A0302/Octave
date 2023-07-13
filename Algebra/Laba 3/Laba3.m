#1 
A = [ 1 3 5 7;
      2 -1 3 5;
      0 0 2 5;
     -2 -6 -3 1];
b = [ 1;
      2;
      3;
      4];
      
[L, U, P] = lu(A);

X =  inv(U) * inv(L) * P * b;

#2
X = lufact(A, b);
#3
N = 4;
A = [ 1 3 5 7;
      2 -1 3 5;
      0 0 2 5;
     -2 -6 -3 1];

[L, U, P] = lu(A);
detU = 1;
detL = 1;
for p = 1: N
detU *= U(p, p);
detL *= L(p, p);
endfor
R = 1:N;
label = 0;
for i = 1: N - 1
    [Y, j] = max(P(i:N,i));
    
   if(j != i) 
   C = A(i, :);
  A(i, :) = A(j+i-1, :);
  A(j+i-1, :) = C;
  d = R(i);
  R(i) = R(j+i-1);
  R(j+i-1) = d;
  label++;
  endif
endfor

if ( mod(label,2) == 0)
  detP = 1;
else 
  detP = -1;
  endif 
detA =detP * detU * detL
det(A)