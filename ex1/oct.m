function wyn = oct(x)
  # wyn = eye(rows(x), rows(x)) - ((2 / norm(x, 2) ** 2) * x * x')
  for m = [1,5,12]
    printf("%d\n", m)
  endfor
endfunction