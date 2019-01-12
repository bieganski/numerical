x4 = @(a, b) linspace(a, b, 4);
x16 = @(a, b) linspace(a, b, 16);
x64 = @(a, b) linspace(a, b, 64);

warning('off', 'all');

TO_BE_PLOT = [1,2,3,4,5,6];

a = -2 * pi;
b = pi;

p = linspace(a, b, 1000); # punkty, dla których liczymy wartość
p_cos = cos(3 * p);


printf("NORMY MAKSIMUM NA 1000PUNKTACH\n\n");

printf("f(x) = cos(3x)\n");


# węzły równoodległe

if TO_BE_PLOT(TO_BE_PLOT == 1) > 0
  
  figure(1);
  
  printf("interpolacja wielomianowa - węzły równoodległe\n");
  
  # cos(3x), 4
  s1 = subplot(2, 1, 1);
  x = x4(a, b);
  y = cos(3 * x);
  c = interpNewton(x, y);
  interp = Horner(c, x, p);
  plot(p, p_cos, 'g', p, interp, 'b', x, y, 'vr');
  printf("n = 4: %e\n", norm(p_cos - interp, "inf"));
  title(["interpolacja wielomianowa n = 4, równoodległe"]);
  
  # cos(3x), 16
  s2 = subplot(2, 1, 2);
  x = x16(a, b);
  y = cos(3 * x);
  c = interpNewton(x, y);
  interp = Horner(c, x, p);
  plot(p, p_cos, 'g', p, interp, 'b', x, y, 'rv');
  printf("n = 16: %e\n", norm(p_cos - interp, "inf"));
  title(["interpolacja wielomianowa n = 16, równoodległe"]);
  
  axis([s2], [a - 1, b + 1, -1.5, 5]);
  
  # cos(3x), 64, tylko do liczenia normy
  x = x64(a, b);
  y = cos(3 * x);
  c = interpNewton(x, y);
  interp = Horner(c, x, p);
  printf("n = 64: %e\n", norm(p_cos - interp, "inf"));
endif


# węzły Czebyszewa

if TO_BE_PLOT(TO_BE_PLOT == 2) > 0
   
  figure(2);
  
  printf("interpolacja wielomianowa - węzły Czebyszewa\n");
  
  # cos(3x), 4
  s1 = subplot(2, 1, 1);
  n = 4;
  x = Czeb(a, b, n);
  y = cos(3 * x);
  c = interpNewton(x, y);
  interp = Horner(c, x, p);
  plot(p, p_cos, 'g', p, interp, 'b', x, y, 'rv');
  printf("n = 4: %e\n", norm(p_cos - interp, "inf"));
  title(["interpolacja wielomianowa n = 4, Czybyszewa"]);
  
  # cos(3x), 16
  s2 = subplot(2, 1, 2);
  n = 16;
  x = Czeb(a, b, n);
  y = cos(3 * x);
  c = interpNewton(x, y);
  interp = Horner(c, x, p);
  plot(p, p_cos, 'g', p, interp, 'b', x, y, 'rv');
  printf("n = 16: %e\n", norm(p_cos - interp, "inf"));
  title(["interpolacja wielomianowa n = 16, Czybyszewa"]);
  
  axis([s2], [a - 1, b + 1, -1.5, 5]);
  
  # cos(3x), 64, tylko do liczenia normy
  x = Czeb(a, b, 64);
  y = cos(3 * x);
  c = interpNewton(x, y);
  interp = Horner(c, x, p);
  printf("n = 64: %e\n", norm(p_cos - interp, "inf"));
endif



# B-splajny

if TO_BE_PLOT(TO_BE_PLOT == 3) > 0
    
  figure(3);

  printf("interpolacja B-splajnami - węzły równoodległe\n");
  
  # cos(3x), 4
  subplot(2, 1, 1);
  x = x4(a , b);
  y = cos(3 * x);
  c = Bsplnat(y);
  v = Bsplval(p, c, a, b);
  plot(p, p_cos, 'g', p, v, 'b', x, y, 'vr');
  printf("n = 4: %e\n", norm(p_cos - v, "inf"));
  title(["B-splajny n = 4"]);
  
  # cos(3x), 16
  subplot(2, 1, 2);
  x = x16(a, b);
  y = cos(3 * x);
  c = Bsplnat(y);
  v = Bsplval(p, c, a, b);
  plot(p, p_cos, 'g', p, v, 'b', x, y, 'vr');
  printf("n = 16: %e\n", norm(p_cos - v, "inf"));
  title(["B-splajny n = 16"]);
  
  # cos(3x), 64, tylko do liczenia normy
  x = x64(a, b);
  c = Bsplnat(cos(3 * x));
  v = Bsplval(p, c, a, b);
  printf("n = 64: %e\n", norm(p_cos - v, "inf"));
endif


###############################################################

a = -10;
b = 10;

p = linspace(a, b, 1000); # punkty, dla których liczymy wartość
p_abs = abs(p);

printf("\ng(x) = abs(x)\n");


# węzły równoodległe

if TO_BE_PLOT(TO_BE_PLOT == 4) > 0
  
  figure(4);
  
  printf("interpolacja wielomianowa - węzły równoodległe\n");
  
  # abs(x), 4
  s1 = subplot(2, 1, 1);
  x = x4(a, b);
  y = abs(x);
  c = interpNewton(x, y);
  interp = Horner(c, x, p);
  plot(p, p_abs, 'g', p, interp, 'b', x, y, 'rv');
  printf("n = 4: %e\n", norm(p_abs - interp, "inf"));
  title(["interpolacja wielomianowa n = 4, równoodległe"]);
  
  # abs(x), 16
  s2 = subplot(2, 1, 2);
  x = x16(a, b);
  y = abs(x);
  c = interpNewton(x, y);
  interp = Horner(c, x, p);
  plot(p, p_abs, 'g', p, interp, 'b', x, y, 'rv');
  printf("n = 16: %e\n", norm(p_abs - interp, "inf"));
  title(["interpolacja wielomianowa n = 16, równoodległe"]);
  
  axis([s2], [a, b, -50, 50]);
  
  # abs(x), 64, tylko do liczenia normy
  x = x64(a, b);
  y = abs(x);
  c = interpNewton(x, y);
  interp = Horner(c, x, p);
  printf("n = 64: %e\n", norm(p_abs - interp, "inf"));
endif


# węzły Czebyszewa

if TO_BE_PLOT(TO_BE_PLOT == 5) > 0
   
  figure(5);
  
  printf("interpolacja wielomianowa - węzły Czebyszewa\n");
  
  # abs(x), 4
  s1 = subplot(2, 1, 1);
  n = 4;
  x = Czeb(a, b, n);
  y = abs(x);
  c = interpNewton(x, y);
  interp = Horner(c, x, p);
  plot(p, p_abs, 'g', p, interp, 'b', x, y, 'vr');
  printf("n = 4: %e\n", norm(p_abs - interp, "inf"));
  title(["interpolacja wielomianowa n = 4, Czebyszewa"]);
  
  # abs(x), 16
  s2 = subplot(2, 1, 2);
  n = 16;
  x = Czeb(a, b, n);
  y = abs(x);
  c = interpNewton(x, y);
  interp = Horner(c, x, p);
  plot(p, p_abs, 'g', p, interp, 'b', x, y, 'vr');
  printf("n = 16: %e\n", norm(p_abs - interp, "inf"));
  title(["interpolacja wielomianowa n = 16, Czebyszewa"]);
  
  axis([s2], [a - 1, b + 1, -10, 10]);
  
  # abs(x), 64, tylko do liczenia normy
  x = Czeb(a, b, 64);
  y = abs(x);
  c = interpNewton(x, y);
  interp = Horner(c, x, p);
  printf("n = 64: %e\n", norm(p_abs - interp, "inf"));
endif


# B-splajny

if TO_BE_PLOT(TO_BE_PLOT == 6) > 0
    
  figure(6);

  printf("interpolacja B-splajnami - węzły równoodległe\n");
  
  # abs(x), 4
  subplot(2, 1, 1);
  x = x4(a , b);
  y = abs(x);
  c = Bsplnat(y);
  v = Bsplval(p, c, a, b);
  plot(p, p_abs, 'g', p, v, 'b', x, y, 'vr');
  printf("n = 4: %e\n", norm(p_abs - v, "inf"));
  title(["B-splajny n = 4"]);
  
  # abs(x), 16
  subplot(2, 1, 2);
  x = x16(a, b);
  y = abs(x);
  c = Bsplnat(y);
  v = Bsplval(p, c, a, b);
  plot(p, p_abs, 'g', p, v, 'b', x, y, 'vr');
  printf("n = 16: %e\n", norm(p_abs - v, "inf"));
  title(["B-splajny n = 16"]);
  
  # abs(x), 64, tylko do liczenia normy
  x = x64(a, b);
  c = Bsplnat(abs(x));
  v = Bsplval(p, c, a, b);
  printf("n = 64: %e\n", norm(p_abs - v, "inf"));
endif

