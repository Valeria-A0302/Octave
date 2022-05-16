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