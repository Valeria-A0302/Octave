#4
n = 2000;
#5
R = 5;
hr = R/n;
r = (0: hr: R - hr);
#size(r)
#6
r1 = 0.5;
r2 = 3;
r3 = 3.5;
r4 = 4;
h1 = 1;
h2 = 3;
f = func(r, r1, r2).*h1 + func(r, r3, r4).*h2;
#7
#{
figure(1);
plot(r, abs(f))
xlabel("x");
ylabel("y");
title("Амплитуда");

figure(2);
plot(r, arg(f))
xlabel("x");
ylabel("y");
title("Фаза");
#}
#8 
m = -3;
[j,k] = meshgrid(1:2*n-1,1:2*n-1);

a = round(sqrt((j - n).^2 + (k - n).^2)) + 1; #определяем индекс а для каждой ячейки
fa = (a <= n)*1;                              #Если а <= n, то возвращает 1
a(a > n) = 0;                                 #Если а > n, то возвращает 0

phi = exp(i*m*atan2(k - n, j - n));

A = zeros(2*n - 1);                           #если а = 0, то A[j,k] = 0
A(fa == 1) = f(a(fa == 1));
A = A.*phi;
#{
figure(3)
imagesc(arg(A));
colorbar;

figure(4)
imagesc(abs(A));
colorbar;
#}
#9
P = 5;
hp = P/n;
p = (0: hp: P - hp);
#size(p)
K = besselj(m, 2 * pi * p.' * r).*r;
#10
F = (K * f.') * (hr*(2 * pi / i^m));
#11
#{
figure(3);
plot(p, F)
xlabel("x");
ylabel("y");
title("Функция F");

figure(4);
plot(p, abs(F))
xlabel("x");
ylabel("y");
title("Амплитуда");

figure(5);
plot(p, arg(F))
xlabel("x");
ylabel("y");
title("Фаза");
#}
#12
B = zeros(2*n - 1);
B(fa == 1) = F(a(fa == 1));
B = B.*phi;
#{
figure(6)
imagesc(abs(B));
colorbar;

figure(7)
imagesc(arg(B));
colorbar;
#}