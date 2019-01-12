function c = Bsplnat(y)
  n = length(y) + 2; # 2 dodatkowe równania z drugimi pochodnymi, 
                    # żeby splajny były naturalne
  A = zeros(n, n);
  
  # przypisania niżej wynikają z wyliczonych ręcznie pochodnych
  # w krańcach przedziału
  A(1, 1) = 3;
  A(1, 2) = -6;
  A(1, 3) = 3;
  
  A(n, n - 2) = 3;
  A(n, n - 1) = -6;
  A(n, n) = 3;
  
  if columns(y) > 1
    y = y';
  endif
  
  y_new = zeros(length(y) + 2, 1);
  y_new(2:length(y_new) - 1) = y;
  
  for i = 2:(n - 1)
    A(i, i - 1) = CubicBBaseCoeff(i - 3, i);
    A(i, i)     = CubicBBaseCoeff(i - 2, i);
    A(i, i + 1) = CubicBBaseCoeff(i - 1, i);
  endfor

  A = sparse(A);
  c = A \ y_new;
endfunction
