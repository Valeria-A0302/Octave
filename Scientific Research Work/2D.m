n = 2500;

a = -5;
b = 5;
hx = (b-a)/n;
x = (a:hx:b-hx);

p = -5;
q = 5;
hy = (q-p)/n;
y = (p:hy:q-hy);

alf = input('Введите значение параметра alpha=');
bet = input('Введите значение параметра betta=');

[X,Y] = meshgrid(x,y);
f = exp(1i*alf*X.^3 + 1i*bet*Y.^3);

m = 16384;                                         #m(2 в степени 16 = 65536)
f_new = zeros(m);
f_new((m/2-(n/2-1):m/2+n/2),(m/2-(n/2-1):m/2+n/2)) = f_new((m/2-(n/2-1):m/2+n/2),(m/2-(n/2-1):m/2+n/2)).+ f;

rightLines = zeros(m/2,1);                         #делю каждую строку матрицы пополам и меняю половинки местами
rightLines = f_new(1:m/2,1);
f_new(1:m/2,1) = f_new(m/2+1:m,1);
f_new(m/2+1:m,1) = rightLines;

rightColumns = zeros(1,m/2);                       #делю каждый столбец новой матрицы пополам и меняю половинки местами
rightColumns = f_new(1,1:m/2);
f_new(1,1:m/2) = f_new(1,m/2+1:m);
f_new(1,m/2+1:m) = rightColumns;

F = fft2(f_new)*hx;

rightLinesF = zeros(m/2,1);                         #делю каждую строку матрицы пополам и меняю половинки местами
rightLinesF = F(1:m/2,1);
F(1:m/2,1) = F(m/2+1:m,1);
F(m/2+1:m,1) = rightLinesF;

rightColumnsF = zeros(1,m/2);                       #делю каждый столбец новой матрицы пополам и меняю половинки местами
rightColumnsF = F(1,1:m/2);
F(1,1:m/2) = F(1,m/2+1:m);
F(1,m/2+1:m) = rightColumnsF;

centerF = F((m/2-(n/2-1):m/2+n/2),(m/2-(n/2-1):m/2+n/2));

size(centerF)