function S = simGBM(S0, r, sigma, T, M)
   % simGBM : Simulation for Geometric Brownian Motion
   %
   % SYNTAX:
   %   X = simGBM(M, S0, dT,mu,sigma)
   %
   %   S0                 : Valor inicial del subyacente
   %   r                  : Interés libre de riesgo
   %   sigma              : Volatilidad
   %   T                  : Intervalo de estudio
   %   M                  : Numero de trayectorias
   %
   % SIMULATION
   %  S0 = 100; r = 0.03; sigma = 0.4; T = 2; M = 50;
   %  simGBM(S0, r, sigma, T, M)
   %
N       = 5e2; dT      = T/N;
S       = zeros (M, N+1);
X       = randn (M, N+1);
S(:, 1) = S0;
for n = 1:N
   S(:, n+1) = S(:, n).*exp((r-0.5*sigma^2*dT)+(sigma*sqrt(dT)).*X(:,n));
end
