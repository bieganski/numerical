function [x, R, B] = Householder(A, y)
  n = columns(A);
  m = rows(A);
  R = A;
  B = [];
  for j = 1:n
    r = R(j:end, j);
    s = sign(r(1));
    if (s == 0)
      s = 1;
    endif
    _v = r + (s * norm(r, 2)) * eye(m - j + 1, 1);
    v = zeros(m,1);
    v(j:end,:) = _v;
    v = v / norm(v, 2);
    
    house_coeff = 2;
    R = R - house_coeff * v * (v' * R);
    B = [B, v];
  endfor
  x = QR_LZNK(R, B, y);
  R = R(1:columns(R),:);
endfunction


function x = QR_LZNK(_R, B, _b)
  # x jest rozwiązaniem LZNK Ax = _b dla rozkładu A = QR
  # B - macierz wektorów h_i generujących kolejne macierze Householdera 
  # (nie wyznaczamy Q explicite)
  
  n = columns(_R);
  
  # bierzemy jedynie istotną część macierzy R
  R = _R(1:n,:);
  
  # z macierzy B wyznaczamy wektor Q' * b
  b = QM(B, _b);
  
  x = R \ b(1:n);
endfunction


