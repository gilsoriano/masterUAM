function Z = simBM(M,X0,N,dT,mu,sigma)
   % simBM : Simulation for Brownian motion
   %
   % SYNTAX:
   %   X = simBM(M,X0,N,dT,mu,sigma)
   %
   %   X                  : Matrix (M,(N+1)) containing M simulated trajectories,
   %   each of length N+1
   %   X0                 : Initial value of the simulation
   %   M                  : Number of simulated trajectory
   %   N                  : Number of steps in the simulation
   %   dT                 : Size of time step in simulation
   %   mu,sigma           : Parameters of the GWN process
   %
   %   Simulation parameters
   %     M      = 500;
   %     X0     = 0;
   %     N      = 1e2;
   %     dT     = 2e-2;
   %     mu     = 10;
   %     sigma  = 2;
   %     BM = simBM(M,X0,N,dT,mu,sigma);
Z       = zeros (M, N+1);
X       = randn (M, N+1);
Z(:, 1) = X0;
for n = 1:N
   % Here we place the geometric brownian motion
   %Z(:, n+1) = Z(:, n)*(1+mu*dT)+Z(:, n)*(sigma*sqrt(dT)).*X(:,n);
   % And here we place the arithmetic brownian motion
   Z(:, n+1) = Z(:, n)+mu*dT+(sigma*sqrt(dT)).*X(:,n);
end
x_axis = 0:dT:N*dT;
hFig = figure(1);
set(hFig, 'Position', [100 100 800 500], 'Color', [0.955 0.955 0.955])
for m = 1:M
   plot(x_axis,Z(m,:), 'Color', rand([3,1]));
   hold on;
end
% Now we overlap the average value of the ABM
mean_ABM = (0:mu*dT:N*mu*dT);
dev_ABM_upper = zeros(N,1);
dev_ABM_lower = zeros(N,1);
for n = 2:(N+1)
   dev_ABM_upper(n)  =  mean_ABM(n) + sqrt(sigma^2*dT*n);
   dev_ABM_lower(n)  =  mean_ABM(n) - sqrt(sigma^2*dT*n);
end
mean_plot = plot(x_axis, mean_ABM, 'k', 'linewidth', 3);
   hold on;
dev_plot = plot(x_axis, dev_ABM_upper, 'r', 'linewidth', 2);
   hold on;
plot(x_axis, dev_ABM_lower, 'r', 'linewidth', 2);
   hold off;
   legend([mean_plot, dev_plot], 'Media', 'Desviación');
title('Browniano aritmético');
xlabel('t'); ylabel('X(t)');
