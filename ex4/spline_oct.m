function []= spline_oct ()
  a = -5;
  b = 5;
  
  warning('off', 'all');
  
  f = @(x) 1 / (1 + x^2);
  p = linspace(a,b,1000);
  yp = arrayfun (f, p);
  
  
  ns = [5,9,17,33,65, 200];
  n = length(ns);
  
  figure(1);
  
  for i = 1:n
    x = linspace(a,b,ns(i));
    y = arrayfun (f, x);
    pf = spline(x, y);
    v = ppval(pf, p);
    
    nor = norm(yp - v, "inf");
    printf("n = %d   norm = %e\n", ns(i), nor);
    subplot(2,3,i);
    plot(p, yp, 'g.', p, v, 'b' , x, y, 'o');
    
    title(["węzły równoodległe, n = ", num2str(ns(i)), "\n"]);
  endfor
  
  printf("############## CZEB ##############\n");
  figure(2);
  
  for i = 1:n
    x = Czeb(a,b,ns(i));
    y = arrayfun (f, x);
    pf = spline(x, y);
    v = ppval(pf, p);
    
    nor = norm(yp - v, "inf");
    printf("n = %d  norm = %e\n", ns(i), nor);
    subplot(2,3,i);
    
    plot(p, yp, 'g.', p, v, 'b' , x, y, 'o');
    title(["węzły Czebyszewa, n = ", num2str(ns(i)), "\n"]);
  endfor
  
endfunction