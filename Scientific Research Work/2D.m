n = 2500;

a = -5;
b = 5;
hx = (b-a)/n;

x = (a:hx:b-hx);
y = (a:hx:b-hx);

alf = input('Введите значение параметра alpha=');
bet = input('Введите значение параметра betta=');

[X,Y] = meshgrid(x,y);
f = exp(1i*alf*X.^3 + 1i*bet*Y.^3);

m = 16284;

for i = 1:n
F(i,1:n) = FourierTransform(m, n, f(i,1:n), hx);
endfor

for i = 1:n
j = zeros(1,n);
j = FourierTransform(m, n, transpose(F(1:n,i)), hx);
F(1:n,i) = transpose(j);
endfor

p = n^2/(4*b*m);
q = -p;
hu = (p-q)/n;

u = (q:hu:p - hu);
v = (q:hu:p - hu);

figure(1)
imagesc(u, v, abs(F))
colorbar;
title('Амплитуда полученной функции');

figure(2)
imagesc(u, v, arg(F))
colorbar;
title('Фаза полученной функции');

figure(3)
imagesc(x, y, abs(f))
colorbar;
title('Амплитуда исходной функции');

figure(4)
imagesc(x, y, arg(f))
colorbar;
title('Фаза исходной функции');