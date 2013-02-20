function [Z, meanABM_tstep0, meanABM_tsweep, sampledeviation_tstep0, sampledeviation_tsweep] = autocovBM(ABM, tstep0, tsweep0, tsweep1)
   % autocovBM : Returns the autocovariance matrix of a Brownian Motion
   %
   % SYNTAX:
   %   Z = autocovBM(BM, rows, columns);
   %
   %   ABM      : ABM of [rows] trajectories and [columns] time-steps
   %   tstep0   : Reference time-step to perfom autocovariance
   %   tsweep0  : Lower bound time-step to perform autocovariance
   %   tsweep1  : Upper bound time-step to perform autocovariance
   %
   % STEPS
   %  1.- Calculate sample mean two given time-steps (tstep0 and tstep1)_
   %  2.- Calculate sample deviation of all the trajectories of the ABM
   %      at two given time-steps (tstep0 and tstep1)
   %
   %  SIMULATION PARAMETERS
   %     M      = 500;
   %     X0     = 0;
   %     N      = 4e2;
   %     dT     = 2e-2;
   %     mu     = 10;
   %     sigma  = 2;
   %
   %     tstep0  = 30;
   %     tsweep0 = 40;
   %     tsweep1 = 200;
   %     for i = 1:10
   %        BM     = simBM(M,X0,N,dT,mu,sigma);
   %        autocov = autocovBM(BM, tstep0, tsweep0, tsweep1);
   %        plot(autocov,'Color', rand([3,1]));
   %        hold on;
   %     end
   %
   % Here we calculate the sample mean at time-step tstep0 and tstep1
   [rows, columns] = size(ABM);
   meanABM_tstep0 = (1/rows)*sum(ABM(:, tstep0));
   meanABM_tsweep = zeros(1, tsweep1 - tsweep0 + 1);
   for sweep = 1:(tsweep1-tsweep0+1)
      meanABM_tsweep(sweep) = (1/rows)*sum(ABM(:, sweep));
   end

   % Here we calculate the arrays of sample deviations
   sampledeviation_tstep0 = ABM(:, tstep0) - meanABM_tstep0;
   sampledeviation_tsweep  = zeros(rows, tsweep1 - tsweep0 + 1);
   for sweep = 1:(tsweep1-tsweep0+1)
      sampledeviation_tsweep(:,sweep) = ABM(:, sweep) - meanABM_tsweep(sweep);
   end
   Z = zeros(tsweep1 - tsweep0 + 1, 1);
   % Finally we calculate the autocovariance
   for sweep = 1:(tsweep1-tsweep0+1)
      Z(sweep) = (1/rows)*sum(sampledeviation_tstep0.*sampledeviation_tsweep(:,sweep));
   end
