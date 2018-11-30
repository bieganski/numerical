function [bladJ, bladGS] = oct (n)
  #A = spdiags ([ones(n, 1), 2 * ones(n, 1), ones(n, 1)], [-1 0 1], n, n);
  #X = rand(n, 1);
  #b = A * X;
  
  #[xJ, iteracjeJ] = Jacobi(A, b);
  
  #[xGS, iteracjeGS] = GS(A, b);
  
  #bladJ = norm (xJ - X, 2) / norm(X, 2)
  #bladGS = norm (xGS - X, 2) / norm(X, 2)
  
  #iteracjeJ
  #iteracjeGS
endfunction



function [xk, iter] = Jacobi (A, b, tol = 1e-8, maxiter = 1e6)
  xk = zeros(columns(A), 1);
  xk_1 = xk;
  Q = diag(diag(A));
  iter = 0;
  stop = false;
  while (!stop)
    xk_1 = xk;
    xk = Q \ ((Q - A) * xk_1 + b);
    stop = norm(xk - xk_1) <= tol || iter >= maxiter;
    iter++;
  endwhile
endfunction


function [xk, iter] = GS(A, b, tol = 1e-8, maxiter = 1e6)
  xk = zeros(columns(A), 1);
  xk_1 = xk;
  
  L = tril(A, -1)
  U = triu(A, 1)
  D = diag(diag(A))
  
  iter = 0;
  stop = false;
  while (!stop)
    xk_1 = xk;
    xk = D \ ((L + U) * xk + b);
    stop = norm(xk - xk_1) <= tol || iter >= maxiter;
    iter++;
  endwhile
endfunction



function x = rysuj()
  x = linspace(2-1e-4, 2+1e-4)
  y = 
endfunction