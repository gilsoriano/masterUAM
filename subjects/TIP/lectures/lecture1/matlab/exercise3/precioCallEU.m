function precio = precioCallEU(S0,K,r,T,sigma)
   %  precioCallEU: Precio de una call europea
   %
   %   SINTAXIS:
   %   precio = precioCallEU(S0,K,r,T,sigma)
   %
   %   precio: Precio de una call europea
   %   S0 : Precio inicial del subyacente
   %   K : Precio de ejercicio (Strike)
   %   r : tipo de interés libre de riesgo
   %   T : tiempo de vencimiento
   %   sigma : volatilidad
   %
   %   EJEMPLO:
   %   S0 = 100; K = 90; r = 0.03; T = 2; sigma = 0.4;
   %   precioCallEU(S0,K,r,T,sigma)
   %
   tol   = 1e-6; % Automatically set precision target
   R     = 10; % ~ norminv(1-eps); % Approximately infty for N(0,1) variable
   lower = r - R*sigma; % lower limit of effective support interval
   upper = r + R*sigma; % upper limit of effective support interval
   precio = exp(-r*T)*quadl(@(x)quadfunction(S0, K, r, T, sigma, x), lower, upper,tol)

   %  Simplemente por tener una interpretación gráfica:
   X = rand(1e6,1);
   Sx = S0*exp((r-0.5*sigma^2)*T+sigma*sqrt(T).*X);
   hist(exp(-r*T).*Sx, 40);
   title('Histograma de la evolución del subyacente referido al presente');
   xlabel('Valor subyacente'); ylabel('Ocurrencias');
   %  BShoyMax = max(exp(-r*T).*Sx)
   %  BShoyMean = mean(exp(-r*T).*Sx)
   %  BShoyMin = min(exp(-r*T).*Sx)
   %  PEhoy = exp(-r*T)*K
   %   El histograma representa la evoluci\'on del precio del subyacente referido a
   %   la moneda presente.
   %  min(Sx)
   %  max(Sx)
   %  S0*exp(r*T)
