n = 2000;
a = -10;
b = 10;
h = (b-a)/n;

x = (a:h:b);
size(x)
x(end) = [];
size(x)

f = airy(1,-x);
plot(x,f)
xlabel("x");
ylabel("y");
title("Funtion f(-x)");

f1 = airy(1, 2*(-x));
plot(x, f1)
xlabel("x");
ylabel("y");
title("Funtion f(-2x)");

f2 = airy(1, (-x + 5));
plot(x, f2)
xlabel("x");
ylabel("y");
title("Funtion f(-x + 5)");

plot(x(1: end/4), f(1: end/4))
xlabel("x");
ylabel("y");
title("First quarter f(-x)");

plot(x(1: end/4), f1(1: end/4))
xlabel("x");
ylabel("y");
title("First quarter f(-2x)");

plot(x(1: end/4), f2(1: end/4))
xlabel("x");
ylabel("y");
title("First quarter f(-x + 5)");

domain = x > 0 & x < 7;
plot(x(domain), f(domain))
xlabel("x");
ylabel("y");
title("Function f(-x) on the interval [0, 7]");

g = besselj(1,x);
plot(x, g)
xlabel("x");
ylabel("y");
title("Funtion g");

s = f + g;
p = f.*g;




