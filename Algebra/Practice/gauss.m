function X = gauss(A, B)
#инициализация Х и временное сохранение матрицы С
[N N] = size(A);
X = zeros(N, 1);
C = zeros(1, N+1);
#вид расширенной матрицы Aug
Aug = [A B];
for p = 1:N-1
#частный выбор главного элемента для столбца р
  [Y, j] = max(abs(Aug(p:N, p)));
#меняем местами строки p и j 
  C = Aug(p,:);
  Aug(p,:) = Aug(j+p-1, :);
  Aug(j+p-1, :) = C;
#процесс исключения для столбца р 
  for k = p+1:N
    m = Aug(k, p)/Aug(p, p);
    Aug(k, p:N+1) = Aug(k, p:N+1) - m * Aug(p,p:N+1);
  end
  
end
#решение системы с верхнетреугольной матрицей
X = backsub(Aug(1:N, 1:N), Aug(1:N, N+1));