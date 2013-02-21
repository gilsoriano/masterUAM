function S = simGBM(S0, r, sigma, T, M)
   %  simGBM : Simulation for Geometric Brownian Motion
   %
   %  SYNTAX:
   %    X = simGBM(M, S0, dT,mu,sigma)
   %
   %    S0                 : Valor inicial del subyacente
   %    r                  : Interes libre de riesgo
   %    sigma              : Volatilidad
   %    T                  : Intervalo de estudio
   %    M                  : Numero de trayectorias
   %
   %  SIMULATION
   %   S0 = 100; r = 0.3; sigma = 0.04; T = 2; M = 1e3;
   %   [S, x_axis] = simGBM(S0, r, sigma, T, M);
   %
   N       = 1e3 + 1;
   times = linspace(0, T, N);dT      = times(2) - times(1);
   S       = zeros (M, N);
   X       = randn (M, N);
   S(:, 1) = S0;
   for n = 1:(N-1)
      S(:, n+1) = S(:, n).*exp((r-0.5*sigma^2)*dT+(sigma*sqrt(dT)).*X(:,n));
   end
   hFig = figure(1);
   set(hFig, 'Position', [100 100 800 500], 'Color', [0.955 0.955 0.955]);
   for m = 1:M
      plot(times, S(m,:), 'Color', rand([3,1]));
      hold on;
   end
   %  Now we overlap the average value of the ABM
   mean_ABM      = zeros(N+1,1);
   dev_ABM_upper = zeros(N,1);
   dev_ABM_lower = zeros(N,1);
   mean_ABM      = S0*exp((r+0.5*sigma^2).*times);
   var_ABM       = S0^2*exp((2*r+sigma^2).*times).*(exp(sigma^2.*times)-1);
   dev_ABM_upper =  mean_ABM + sqrt(var_ABM);
   dev_ABM_lower =  mean_ABM - sqrt(var_ABM);
   mean_plot = plot(times, mean_ABM, 'k', 'linewidth', 4);
      hold on;
   dev_plot = plot(times, dev_ABM_upper, 'r', 'linewidth', 3);
      hold on;
   plot(times, dev_ABM_lower, 'r', 'linewidth', 3);
      hold off;
      legend([mean_plot, dev_plot], 'Media', 'Varianza');
   title('Browniano geometrico');
   xlabel('t'); ylabel('S(t)');
