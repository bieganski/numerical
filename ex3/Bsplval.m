function v = Bsplval(z,c,a,b)
  # Wyznacza wartości interpolacji w zadanych punktach
  # za pomocą algorytmu de Boor'a.
  # [a, b] - dany przedział
  # c - współczynniki B-splajnu
  # z - punkty, dla których liczymy wartość interpolacji
  
  # ilość B-splajnów
  n = length(c);
  _knots = linspace(a, b, n - 2);
  
  p = 3; # stopień B-splajnu
  
  knots = zeros(1, length(_knots) + 2 * p); # padding
  knots(4:(end - 3)) = _knots;
  knots(1) = _knots(1);
  knots(2) = _knots(1);
  knots(3) = _knots(1);
  knots(end) = _knots(end);
  knots(end - 1) = _knots(end);
  knots(end - 2) = _knots(end);
  
  sect_len = (b - a) / (n - 3);
  
  for i = z
    assert(i <= b && i >= a);
  endfor
  
  # dla każdego interpolowanego punktu p wyznaczamy indeks
  # największego punktu interpolacji mniejszego od p
  k_arr = arrayfun(@(x) floor((x - a) / sect_len), z);
  
  v = zeros(size(z));
  
  j = 1;
  for x = z
    d = zeros(1, p + 1);
    
    # x <- [x_k, x_k+1), poza przypadkiem x == b
    k = k_arr(j); 
    if (k == length(c) - 3)
      k = k - 1;
    endif
    
    for i = 1:(p + 1)
      d(i) = c(k - i + p + 2);
    endfor
    
    for i = 1:p
      kk = p - i + 1; # minimalnie 1
      for ii = 1:(p + 1 - i)
        x_i_plus_k = knots(k - ii + p + 2 + kk);
        x_i = knots(k - ii + p + 2);
        d(ii) = ((x - x_i) * d(ii) + (x_i_plus_k - x) * d(ii + 1)) ...
                / (x_i_plus_k - x_i);        
      endfor
    endfor
    v(j) = d(1);
    j = j + 1;
  endfor

endfunction
