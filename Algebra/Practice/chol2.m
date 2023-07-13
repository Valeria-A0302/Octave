function G = chol2(A)
%���� - � - ������������ ������������ ����������� NxN �������
%����� - G - ������� ������� NxN, �������� G(i, j) ��� i >= j ������� 
%�������� ������� �� ���������� ��������� A = GG'
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