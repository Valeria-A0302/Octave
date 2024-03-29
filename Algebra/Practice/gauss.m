function X = gauss(A, B)
#������������� � � ��������� ���������� ������� �
[N N] = size(A);
X = zeros(N, 1);
C = zeros(1, N+1);
#��� ����������� ������� Aug
Aug = [A B];
for p = 1:N-1
#������� ����� �������� �������� ��� ������� �
  [Y, j] = max(abs(Aug(p:N, p)));
#������ ������� ������ p � j 
  C = Aug(p,:);
  Aug(p,:) = Aug(j+p-1, :);
  Aug(j+p-1, :) = C;
#������� ���������� ��� ������� � 
  for k = p+1:N
    m = Aug(k, p)/Aug(p, p);
    Aug(k, p:N+1) = Aug(k, p:N+1) - m * Aug(p,p:N+1);
  end
  
end
#������� ������� � ����������������� ��������
X = backsub(Aug(1:N, 1:N), Aug(1:N, N+1));