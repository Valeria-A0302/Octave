function centerVectorTwo = FourierTransform(m, n, vector, hx)
    vectorOne = zeros(1,m);
    vectorOne(1, m/2-(n/2-1):m/2+n/2) = vectorOne(1, m/2-(n/2-1):m/2+n/2).+ vector; 
  
    vectorOne = fftshift(vectorOne);
    
    vectorTwo = fft(vectorOne)*hx;
    
    vectorTwo = fftshift(vectorTwo);
    
    centerVectorTwo = vectorTwo(1, m/2-(n/2-1):m/2+n/2);
endfunction
