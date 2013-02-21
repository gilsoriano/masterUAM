function graph = plotautocovBM(M,X0,N,dT,mu,sigma,tstep0, tsweep0, tsweep1, nplotcov)
   % plotautocovBM : functions that plots together several autocovariances of ABMs
   %
   % M          :  Number of simulated trajectory
   % X0         :  Starting point for the ABM
   % N          :  Number of steps in the simulation
   % dT         :  Size of time step in simulation
   % mu, sigma  :  Parameters of the GWN process
   % tstep0     : Time step for the reference autocovariance ABM sample
   % tsweep0    : Initial time step for the sweep ABM used in the autocovariance
   % tsweep1    : End time step for the sweep ABM used in the autocovariance
   % nplotcov   : Number of ABM autocovariance plots to be displayed
   %
   % SYNTAX:
   %   Z = autocovBM(BM, rows, columns);
   %
   %   ABM      : ABM of [rows] trajectories and [columns] time-steps
   %   tstep0   : Reference time-step to perfom autocovariance
   %   tsweep0  : Lower bound time-step to perform autocovariance
   %   tsweep1  : Upper bound time-step to perform autocovariance
   %
   %  SIMULATION PARAMETERS
   %     M        = 500;
   %     X0       = 0;
   %     N        = 1e2;
   %     dT       = 2e-2;
   %     mu       = 10;
   %     sigma    = 2;
   %     tstep0   = 30;
   %     tsweep0  = 1;
   %     tsweep1  = 50;
   %     nplotcov = 100;
   %
   %     plotautocovBM(M,X0,N,dT,mu,sigma,tstep0, tsweep0, tsweep1, nplotcov)
   hFig = figure(1);
   set(hFig, 'Position', [100 100 800 500], 'Color', [0.955 0.955 0.955])
   autocov = zeros(tsweep1-tsweep0+1, nplotcov);
   for i = 1:nplotcov
      BM     = simBM(M,X0,N,dT,mu,sigma);
      autocov(:,i) = autocovBM(BM, tstep0, tsweep0, tsweep1);
   end
   exact_autocov = zeros(tsweep1-tsweep0+1, 1);
   for i = 1:tsweep1-tsweep0+1
      exact_autocov(i) = sigma^2*min(tstep0, i-1+tsweep0)*dT;
   end
   x_axis = tsweep0:tsweep1;
   for i = 1:nplotcov
      plot(x_axis, autocov(:,i),'Color', rand([3,1]));
      hold on;
   end
   exact_plot = plot(x_axis, exact_autocov, 'b', 'linewidth', 3);
   hold off;
   title('Autocovarianza ABM');
   xlabel('n2'); ylabel('Cov(X[n1]X[n2])');
   legend(exact_plot, 'Autocovarianza teórica');
