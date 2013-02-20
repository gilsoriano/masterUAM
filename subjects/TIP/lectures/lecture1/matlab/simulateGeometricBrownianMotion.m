function S = simulateGeometricBrownianMotion(M,S0,mu,sigma,times)
%simulateGeometricBrownianMotion: Simulate Brownian motion
% 
% EXAMPLE 1: 
%       S0 = 100.0;  mu = 0.2; sigma = 0.2;
%       T = 10; N = 100; times = linspace(0,T,N);
%       M = 150;
%       S = simulateGeometricBrownianMotion(M,S0,mu,sigma,times);
%       figure(1); plot(times,S'); xlabel('t'); ylabel('S(t)')
%
% EXAMPLE 2: 
%       S0 = 100.0;  mu = 0.2; sigma = 0.2;
%       T = 10; N = 100; times = linspace(0,T,N);
%       M = 10000;
%       S = simulateGeometricBrownianMotion(M,S0,mu,sigma,times);
%       meanS = S0*exp(mu*times); 
%       stdevS = S0*exp(mu*times).*sqrt(exp(sigma^2*times)-1);
%       figure(1); plot(times,S')
%                  hold on;
%                  plot(times,meanS,'k','linewidth',2)
%                  hold off
%                  xlabel('t'); ylabel('S(t)')                   
%       figure(2); subplot(2,1,1); plot(times,mean(S),times,meanS); 
%                  xlabel('t'); ylabel('E[S(t)]'); legend('empirical','theoretical',2);                   
%       figure(2); subplot(2,1,2); plot(times,std(S),times,stdevS); 
%                  xlabel('t'); ylabel('stdv[S(t)]'); legend('empirical','theoretical',2);                   
%
%       nBins = 100; nFigure = 3;
%       empPdfGraphComp(S(:,end)/S0,@(x)lognpdf(x,(mu-sigma^2/2)*T,sigma*sqrt(T)),nBins,nFigure);
%       title('Histogram of S(T)')
%
dT = repmat(diff(times),M,1);
X = randn(size(dT));
S = cumprod([S0*ones(M,1).*exp((mu-sigma^2/2)*dT + sigma*sqrt(dT).*X)],2);








