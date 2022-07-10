function centerVectorTwo = FourierTransform(m, n, vector, hx)
    vectorOne = zeros(1,m);
    vectorOne(1, m/2-(n/2-1):m/2+n/2) = vectorOne(1, m/2-(n/2-1):m/2+n/2).+ vector; 
  
    right = zeros(1,m/2);
    right = right(1, 1:m/2).+ vectorOne(1, 1:m/2);
    vectorOne(1, 1:m/2) = vectorOne(1, m/2+1:m);
    vectorOne(1, m/2+1:m) = right;
    
    vectorTwo = fft(vectorOne)*hx;
    
    rightVectorTwo = zeros(1,m/2);
    rightVectorTwo = rightVectorTwo.+ vectorTwo(1, 1:m/2);
    vectorTwo(1, 1:m/2) = vectorTwo(1, m/2+1:m);
    vectorTwo(1, m/2+1:m) = rightVectorTwo;
    
    centerVectorTwo = vectorTwo(1, m/2-(n/2-1):m/2+n/2);
endfunction