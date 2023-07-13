function F = FrenelTransform (m, n, X, Y, u, v, f, hx, kw, z)
  f = f.*exp(1i*kw.*(X.^2 + Y.^2)./(2.*z));
  
  for i = 1:n
    F(i,1:n) = FourierTransform2(m, n, f(i,1:n), hx);
  endfor

  for i = 1:n
    j = zeros(1,n);
    j = FourierTransform2(m, n, transpose(F(1:n,i)), hx);
    F(1:n,i) = transpose(j);
  endfor

  F = F.*(-1i*kw/2*pi*z).*exp(1i*kw*z).*exp(1i*kw.*(u.^2 + v.^2)./(2.*z));
endfunction
