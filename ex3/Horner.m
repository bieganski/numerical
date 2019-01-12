function v = Horner(c, x, z)
  # c, x - współczynniki wielomianu w bazie Newtona i węzły
  # z - punkty, w których wartości poszukujemy
  # v - wartości wielomianu w punktach wektora z
  
  n = length(x);
  res = 0;
  v = zeros(size(z));
  for i = n:-1:1
    v .*= (z - x(i));
    v += c(i);
  endfor
endfunction