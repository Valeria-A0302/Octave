###1
##
##A1 = [ 1 1/2 1/3 1/4;
##     1/2 1/3 1/4 1/5;
##     1/3 1/4 1/5 1/6;
##     1/4 1/5 1/6 1/7]
##b = [1;
##     0;
##     0;
##     0];
##x1 = A1\b
##
###2
##
##A2 = [ 1.0000 0.5000 0.3333 0.2500;
##     0.5000 0.3333 0.2500 0.2000;
##     0.3333 0.2500 0.2000 0.1667;
##     0.2500 0.2000 0.1667 0.1429]
##x2 = A2\b
##
###3
##  
##cond(A2)

#4
##n = 10;
##A3 = hilb(n);
##b2 = zeros(n, 1);
##b2(1,1) = 1;
##x = A3\b2;
##R = round(x);
##delta = R - x;
##con = cond(A3)
##p1 = sum(abs(sum(abs(delta))))

#5
#{
n = 100
A5 = rand(n);
x5 = ones(n,1);

while cond(A5) >= 1000
  A5 = rand(n,n);
end

b5 = A5 * x5;
cond(A5)
x4 = A5\b5;
delta5 = round(x4) - x4;
p = sum(abs(sum(abs(delta5))))
#}
#6
#{
p1 
p
#}
#7
N = 100

A = rand(N);
A(N,:) = A(N-1,:);
A(N,N) = A(N,N) + 1e-10;
condition = cond(A)
det(A)

x = ones(N,1);
b = A*x;
x2 = A\b;
delta = x - x2;
p = sum(abs(sum(abs(delta))))