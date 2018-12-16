function c = interpNewton(x, y)
  # x, y - wektory określające węzły i wartości w węzłach
  # c - wektor współczynników wielomianu w bazie Newtona
  c = y;
  assert(columns(x) > 1); # TODO shape
 
  for j = 2:columns(c)
    prev_val = c(j - 1);
    first = true;
    for i = j:columns(c)
      act_val = (c(i) - c(i - 1)) / (x(i) - x(i - j + 1));
      if first == true
        first = false;
      else
        c(i - 1) = prev_val;
      endif
      prev_val = act_val;
    endfor
    c(columns(c)) = prev_val;
  endfor
endfunction