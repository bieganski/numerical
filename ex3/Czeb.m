function x = Czeb(a, b, n)
  i = 0 : (n - 1);
  _x = arrayfun(@(x) cos((2 * x + 1) / (2 * n + 2) * pi), i);
  x = arrayfun(@(x) (a + b) / 2 + ((b - a) / 2 ) * x, _x);
endfunction
