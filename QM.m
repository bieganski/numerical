function M = QM(B, _M)
  # dla macierzy M i macierzy B, będącej macierzą wektorów _h_i_ generujących
  # H_i zwraca iloczyn B * M = H1 * H2 * ... * Hk * M
  # bez wyliczania macierzy H1 * H2 * ... * Hk explicite.
  
  # gdy M ma zbyt mało wierszy, dopełnijmy ją zerami
  #M = zeros(rows(B), columns(_M))
  #M(1:rows(_M),:) = _M
  
  n = columns(B);
  M = _M;
  for i = 1:n
    v = B(:,i);
    house_coeff = 2 / norm(v, 2) ** 2;
    M = M - house_coeff * v * (v' * M);
  endfor
  
  # obcinamy M do początkowego rozmiaru
  #M = M(1:rows(_M),:)
endfunction