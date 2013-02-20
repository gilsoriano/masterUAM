function [t,Z] = simulationIto(Z0,a,b,t0,T,M,N)
% simulationIto: integration of a SDE of the Itô form
% 
% SYNTAX: [t,Z] = simulationIto(Z0,a,b,t0,T,M,N)
%     [t,Z]: Trajectory
%     Z0: Intial value
%     f: drift (deterministic) term
%     g: diffusion (stochastic) term
%     t0: initial time
%     T: length of simulation interval
%     N: Number of steps in simulation
%
%  EXAMPLE 1:
%     B0 = 0; r = 10; sigma = 2.0;
%     t0 = 0; T = 2;
%     M = 500; N = 100;
%     a = @(t,Z)(r);     % Arithmetic BM drift
%     b = @(t,Z)(sigma); % Arithmetic BM diffusion
%     [t,B] = simulationIto(B0,a,b,t0,T,M,N);
%     figure(1); 
%     plot(t,B0+r*(t-t0),'k','linewidth',2); 
%     hold on; 
%     plot(t,B');
%     plot(t,B0+ r*(t-t0),'k','linewidth',2); 
%     hold off;
%     legend('average');
%     xlabel('t'); ylabel('B(t)');
%     
%
%  EXAMPLE 2: 
%     S0 = 100; r = 0.05; sigma = 0.2; 
%     t0 = 0; T = 20; 
%     M = 500; N = 100;
%     a = @(t,Z)(r*Z);     % BS drift
%     b = @(t,Z)(sigma*Z); % BS diffusion
%     [t,S] = simulationIto(S0,a,b,t0,T,M,N);
%     figure(1); 
%     plot(t,S0*exp(r*(t-t0)),'k','linewidth',2); 
%     hold on; 
%     plot(t,S');
%     plot(t,S0*exp(r*(t-t0)),'k','linewidth',2); 
%     hold off;
%     legend('average');
%     xlabel('t'); ylabel('S(t)');
%     ST = S(:,end); 
%     figure(2); nBins = 40; hist(S(:,end),nBins); 
%     mu = mean(log(ST)); sigma = std(log(ST));
%     normFactor = (max(ST)-min(ST))*M/nBins;
%     nPlot = 1e3; slackPlot = 0.1; 
%     xPlot = linspace((1-slackPlot)*min(ST),(1+slackPlot)*max(ST),nPlot);
%     hold on; 
%     plot(xPlot,normFactor*lognpdf(xPlot,mu,sigma),'r','linewidth',2);
%     hold off; 
%     legend('empirical distribution','lognormal fit');
%
t = linspace(t0,t0+T,N+1);   deltaT = t(2)-t(1);
Z = zeros(M,N+1);
X = randn(M,N);
Z(:,1) = Z0;
for n = 1:N
    Z(:,n+1) =  Z(:,n) + feval(a,t(n),Z(:,n))*deltaT + feval(b,t(n),Z(:,n)).*X(:,n)*sqrt(deltaT);
end

