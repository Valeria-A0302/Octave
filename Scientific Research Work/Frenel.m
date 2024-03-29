n = 250;
a = -1;
b = 1;
hx = (b-a)/n;
x = (a:hx:b-hx); 
y = (a:hx:b-hx);

[X,Y] = meshgrid(x,y);

sg = 0.1; 
cnm = 200;                                  %����������� ��������� �������
Cn = 10+1i;                                 %����������� ����� ������
z = input("������� ����� z: ");             %���������� � �� 500 ��� 1000
wl = 0.0005;                                %����� ����� � �� 0.0005
kw = 2*pi/wl;                               %�������� �����

%����������� 3-�� �������
%f2 = exp(1i * cnm * (X.^2 - Y.^2)); 

%���� 3-�� ������� �������������� ���������� �������
%f2 = exp(1i * cnm * (3*X.^3 + 3*X.*Y.^2));

%�������������� �������������� ���������� �������
%f2 = exp (1i * cnm * (2*X.^2 + 2*Y.^2 - 1)); 
    
%������� ������
M1 = 2;
M2 = -5;
M3 = 8;
%f0 = exp(-(X.^2+Y.^2)/sg^2);                #������ �����
f = exp(-(X.^2+Y.^2)/sg^2) .* (Cn .* (((X+1i*sign(M1).*Y)/sg).^abs(M1))); %������
%f0 = exp(-(X.^2+Y.^2)/sg^2) .*(Cn .* (((X+1i*sign(M1).*Y)/sg).^abs(M1)) + 5 .* (((X+1i*sign(M2).*Y)/sg).^abs(M2)));
#f = exp(-(X.^2+Y.^2)/sg^2) .* (Cn .* (((X+1i*sign(M1).*Y)/sg).^abs(M1)) + 5 .* (((X+1i*sign(M2).*Y)/sg).^abs(M2)) + 8.*(((X+1i*sign(M3).*Y)/sg).^abs(M3))); #����� 

%���� ������-������� ��� �������� ������, ����� N = 0
r = sqrt(X.^2 + Y.^2);
M = 6;
%f = exp((-r.^2)./(2*sg^2)).*((X+1i*sign(M).*Y).^abs(M));

%f = f0 .* f2;

#����� �����������
figure(1)
imagesc(arg(f))
colorbar;
title('���� �������� �������');

figure(2)
imagesc((abs(f)).^2)
colorbar;
title('������������� �������� �������');

%m = 1024;
m = 512;
%m = 256;
#������������ �������
p = ((n^2)*wl*z)/(4*b*m);
q = -p;
hu = (p-q)/n;

u = (q:hu:p - hu);
v = (q:hu:p - hu);

F = FrenelTransform(m, n, X, Y, u, v, f, hx, kw, z); #�������� �������������� �������

#����� �����������
figure(3)
imagesc(u, v, arg(F))
colorbar;
title('���� ����� �� �������');

figure(4)
imagesc(u, v, (abs(F)).^2)
colorbar;
title('������������� ����� �� �������');
