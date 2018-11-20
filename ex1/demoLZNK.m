
for m = [5, 10, 20, 100]
  printf("obliczam LZNK dla m = %d\n", m);
  x = linspace(0, 10, m);
  eps = 10 ** (-2);
  y = arrayfun(@(el) el ** 2 - 5 * el + 2 + rand * sign(rand - .5) * eps, x)';
  V = vander(x, 3);
  [x, R, B] = Householder(V, y);
  printf("LZNK dla m = %d:\n", m);
  x
  
  # B została obicięta do istotnej części, w celu policzenia normy dopełnijmy ją
  # do dobrego wymiaru
  _R = zeros(rows(B), columns(R));
  _R(1:rows(R),:) = R;
  
  uncertainity = norm(V - QM(B, _R), 2) / norm(V, 2);
  printf("Błąd dla m = %d wynosi %.5f:\n", m, uncertainity);
endfor
