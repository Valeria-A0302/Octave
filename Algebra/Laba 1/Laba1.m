#1
#{
A = [ 1 1 1; 
      1 2 4;
      1 3 9];
B = [ 6; 5; 2];
A\B
#}

#2
#{
n = 2000;
a = -5;
b = 5;
hx = (b-a)/n;
x = (a: hx: b - hx);

y = -1.*x.*x + 2.*x + 5;

figure(1)
x0 = [1,6];
x1 = [2, 5];
x2 = [3, 2];

hold on;
plot(x, y)
xlabel("x");
ylabel("y");
title("График параболы");

plot(x0(1), x0(2), ".<")

plot(x1(1), x1(2), "x")

plot(x2(1), x2(2), ".<")

hold off;
#}
#3
#{
N = 7;
X = [0, 1, 2, 3, 4, 5, 6];
Y = [1; 3; 2; 1; 3; 2; 1];

A = zeros(N);

for i = 1: N
 for j = 1:N
   A(i, j) = A(i, j) + (X(i).^(j - 1));
 endfor
endfor
B = A\Y

figure(2)
a = 0;
b = 6;
n = 1000;
hx = (b-a)/n;
x = (a: hx: b);

y = B(1) + B(2)*x + B(3)*x.^2 + B(4)* x.^3 + B(5)* x.^4 + B(6)*x.^5 + B(7)*x.^6;

x0 = [0, 1];
x1 = [1, 3];
x2 = [2, 2];
x3 = [3, 1];
x4 = [4, 3];
x5 = [5, 2];
x6 = [6, 1];

hold on;
plot(x, y)
xlabel("x");
ylabel("y");
title("График параболы");

plot(x0(1), x0(2), ".<")
plot(x1(1), x1(2), "x")
plot(x2(1), x2(2), ".<")
plot(x3(1), x3(2), ".<")
plot(x4(1), x4(2), "x")
plot(x5(1), x5(2), ".<")
plot(x6(1), x6(2), "x")

hold off;
#}