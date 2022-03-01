#3
n = 2000;

#4
a = -10;
b = 10;
h = (b-a)/n;
x = (a:h:b);
size(x)
x(end) = [];
size(x)

#5
f = airy(1,-x);

#6
#{
plot(x,f)
xlabel("x");
ylabel("y");
title("Funtion f(-x)");
#}
#7
f1 = airy(1, 2*(-x));
#{
plot(x, f1)
xlabel("x");
ylabel("y");
title("Funtion f(-2x)");
#}
f2 = airy(1, (-x + 5));
#{
plot(x, f2)
xlabel("x");
ylabel("y");
title("Funtion f(-x + 5)");
#}
#8
#{
figure(1)
plot(x(1: end/4), f(1: end/4))
xlabel("x");
ylabel("y");
title("First quarter f(-x)");

figure(2)
plot(x(end/4: end * 3/4), f(end/4: end * 3/4))
xlabel("x");
ylabel("y");
title("First quarter f(-x)");
#}
#9
domain = x > 0 & x < 7;
#{
plot(x(domain), f(domain))
xlabel("x");
ylabel("y");
title("Function f(-x) on the interval [0, 7]");
#}
#10
g = besselj(1,x);
#{
plot(x, g)
xlabel("x");
ylabel("y");
title("Funtion g");
#}
#11
s = f + g;
p = f.*g;

#12
#{
plot(x, f, "-;f(x);c")
hold on;
plot(x, g, "-.;g(x);r")
plot(x(1: 30: end), s(1: 30: end), ".<;f(x) + g(x); b")
plot(x(1: 30: end), p(1: 30: end), "--.<;f(x)g(x); m")
hold off;
#}
#13
#{
figure(1)
plot(x, real(f))
xlabel("x");
ylabel("y");
title("Real part of function f(x)");

figure(2)
plot(x, imag(f))
xlabel("x");
ylabel("y");
title("Image part of function f(x)");

figure(3)
plot(x, abs(f))
xlabel("x");
ylabel("y");
title("Amplitude of function f(x)");

figure(4)
plot(x, arg(f))
xlabel("x");
ylabel("y");
title("Phase of function f(x)");
#}
#14
h = f .* exp(1i * x);
#{
figure(1)
plot(x, real(h))
xlabel("x");
ylabel("y");
title("Real part of function h(x)");

figure(2)
plot(x, imag(h))
xlabel("x");
ylabel("y");
title("Image part of function h(x)");

figure(3)
plot(x, abs(h))
xlabel("x");
ylabel("y");
title("Amplitude of function h(x)");

figure(4)
plot(x, arg(h))
xlabel("x");
ylabel("y");
title("Phase of function h(x)");
#}
#15
F = g.'*f;
#{
figure(5);
imagesc(real(F));
colorbar;
colormap blue;
#}
f1 = f(end/4: end * 3/4);
g1 = g(end/4: end * 3/4);
F1 = g1.'*f1;
#{
figure(6);
imagesc(real(F1));
colorbar;
colormap blue;
#}
#16
y = x;
[X, Y] = meshgrid (x, y);
[F2, G2] = meshgrid (f, g);
G = Y.*F2 + X .*G2;
#{
figure(7);
imagesc(real(G));
colorbar;
colormap blue;
#}
#17
R = sqrt(X.^2 + Y.^2);
FI = atan2(Y, X);

#18
fr = airy(1, -R);
H = fr.* exp(1i*4*FI);
#{
figure(10);
imagesc(real(H));
colorbar;

figure(11);
imagesc(imag(H));
colorbar;

figure(12);
imagesc(abs(H));
colorbar;

figure(13);
imagesc(arg(H));
colorbar;
#}
#19
middle = H(end/2, :);

figure(14);
plot(real(middle));


figure(15);
plot(imag(middle));


figure(16);
plot(abs(middle));

figure(17);
plot(arg(middle));

