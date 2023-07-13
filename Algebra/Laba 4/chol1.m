function G = chol1(A, b)
%���� - � - ������������ ������������ ����������� NxN �������
%����� - G - ������� ������� NxN, �������� G(i, j) ��� i >= j
%������� �������� ������� �� ���������� ��������� A = GG'
[N N] = size(A);

for l = 1:b:N
r = min(l+b-1, N);

  for j = l:r
    if (j > l)
    A(j:N,j) = A(j:N,j) - A(j:N, l:j-1)*A(j,l:j-1)';
    end
    A(j:N, j) = A(j:N, j) / sqrt(A(j,j));
  endfor

  A(r+1:N, r+1:N) = A(r+1:N, r+1:N) - A(r+1:N, l:r)*A(r+1:N, l:r)';
endfor
G = A;

endfunction