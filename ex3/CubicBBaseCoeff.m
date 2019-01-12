function res = CubicBBaseCoeff(i, j)
  # Wyznacza wartość B{3, i}(x_j) dla węzłów równoodległych,
  # korzystając z rekurencji Coxa–De Boor'a.
  res = double(BBaseCoeff(i, j, 3));
endfunction
  
function res = BBaseCoeff(i, j, k)
  # printf("i, j, k: %d, %d, %d\n", i, j, k);
  res = double(0);
  if j < i || j >= i + k + 1
    res = double(0);
    return;
  endif
  
  # V{k, i}(x_j) ze wzoru rekurencyjnego
  # V = @(k, i, j) if i == j || k == 0 assert(false), else (j - i) / k, end
  V = @(i, j, k) (j - i) / k;
  
  if k == 0
    if i == j res = double(1);, else res = double(0);, end;
    return;
  endif
  
  res = V(i, j, k) * BBaseCoeff(i, j, k - 1);
  res += (1 - V(i + 1, j, k)) * BBaseCoeff(i + 1, j, k - 1);
endfunction