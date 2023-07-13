#Задание 1
#{
A = [ 1/8 2/10 2/5; 
      3/8 5/10 3/5;
      4/8 3/10 0];
B = [ 2.3; 
      4.8; 
      2.9];
A\B
#}

#Задание 2.1
#{
ans = 0;

for i = 1:100000
 ans = ans + 0.1;
end

10000 - ans
ans = 0;

for i = 1:80000
 ans = ans + 0.125;
end

10000 - ans
#}

#Задание 2.2
#{
N = 10^7;

a = rand(N, 1);
b = rand(N, 1);

tic();
c = zeros(N, 1);
for n = 1:N
c(n) = a(n) + b(n);
end
toc()

tic();
c = a + b;
toc();
#}

