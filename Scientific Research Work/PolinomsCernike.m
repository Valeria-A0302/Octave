%Нужно запрограммировать входное поле,
%фаза которого описывается полиномами Цернике.
%Построить от полей преобразование Фурье.
%Построить преобразование Френеля.

n = 250;
a = -1;
b = 1;
hx = (b-a)/n;
x = (a:hx:b-hx); 
y = (a:hx:b-hx);

cnm = 200;
sg = 0.1; 
mp = 7;
cp = (10*1i);
[X, Y] = meshgrid(x, y);
%Круговая функция
#f1 = circ(2*X.^2 + 2*Y.^2 - 1);

%кома 3-го порядка представленная полиномами Цернике
#f2 = exp(1i * cnm * (3*X.^3 + 3*X.*Y.^2 - 2.*X));
#f2 = exp(1i * cnm * (3*X.^3 + 3*X.*Y.^2));

%расфокусировка представленная полиномами Цернике
#f2 = exp (1i * cnm * (2*X.^2 + 2*Y.^2 - 1));

%Функция Гаусса
#f0 = exp(-(X.^2 + Y.^2)/sg^2); 
#f0 = exp(-(X.^2 + Y.^2)/sg^2) .* (cp .* (((X.+1i*Y)/sg).^mp) + 5 .* (((X.+1i*Y)/sg).^3) + (1 + 1i).*(((X.+1i*Y)/sg).^7)); #вихрь 
f0 = exp(-(X.^2 + Y.^2)/sg^2) .* (cp .* (((X.+1i*Y)/sg).^mp));
%астигматизм 3-го порядка
f2 = exp(1i * cnm * (X.^2 - Y.^2));
#f2 = exp(1i * cnm * X.*Y);

f1 = f0 .* f2;

figure(1)
imagesc( abs(f1))
colorbar;
title('Амплитуда входного поля');

figure(2)             
imagesc( arg(f1))
colorbar;
title('Фаза входного поля');


figure(3)
imagesc((abs(f1)).^2)
colorbar;
title('Интенсивность входного поля');



%Выполняю преобразование Фурье
#m = 262144;
#m = 131072;
#m = 65536;
#m = 32768;
#m = 16384;
#m = 4096;
#m = 2048;
#m = 1024;
m = 512;
#m = 256;

for i = 1:n
F1(i,1:n) = FourierTransform2(m, n, f1(i,1:n), hx);
endfor

for i = 1:n
j1 = zeros(1,n);
j1 = FourierTransform2(m, n, transpose(F1(1:n,i)), hx);
F1(1:n,i) = transpose(j1);
endfor

#F1 = fftshift(fft2(f1));

p = n^2/(4*b*m);
q = -p;
hu = (p-q)/n;

u = (q:hu:p - hu);
v = (q:hu:p - hu);

figure(4)              %Строю полученные изображения после преобразования Фурье
imagesc( abs(F1))
colorbar;
title('Амплитуда после пр Фурье');

figure(5)
imagesc( arg(F1))
colorbar;
title('Фаза после пр Фурье');


figure(6)
imagesc( (abs(F1)).^2)
colorbar;
title('Интенсивность после пр Фурье');

