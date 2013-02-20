function Z = simGWN(M,N,mu,sigma)
   % simGWN : Simulation for Gaussian White Noise
   %
   % SYNTAX:
   %Z = simGWN(M,N,mu,sigma)
   %
   %   Z : Matrix (M,N) containing M simulated trajectories,
   %   each of length N
   %   M : Number of simulated trajectory
   %   N : Length of each trajectory
   %   mu,sigma : Parámeters of the GWN process
   %
   % EXAMPLE 1:
   %   M = 3; N = 100;
   %   mu = 0; sigma = 1;
   %   Z = simGWN(M,N,mu,sigma);
   %   figure(1); plot(X'); % Plot all trajectories
   %   axis([1 Inf -Inf Inf])
   %   Z = zeros(M,N); % Reserve memory
   for n = 1:N
      Z(:,n) = randn(M,1); % Update trajectory at each time step.
   end

