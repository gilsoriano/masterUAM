function B = simulateGeneralizedWiener(M,B0,mu,sigma,times)
%simulateGeneralizedWiener: Simulate generalized Wiener Process 
% (arithmetic Brownian motion)
% 
% EXAMPLE 1: 
%       B0 = 1.0;  mu = 0.5; sigma = 0.2;
%       T = 2; N = 100; times = linspace(0,T,N);
%       M = 150;
%       B = simulateGeneralizedWiener(M,B0,mu,sigma,times);
%       figure(1); plot(times,B'); xlabel('t'); ylabel('B(t)')
%
% EXAMPLE 2: 
%       B0 = 1.0;  mu = 0.5; sigma = 0.2;
%       T = 2; N = 100; times = linspace(0,T,N);
%       M = 1000;
%       B = simulateGeneralizedWiener(M,B0,mu,sigma,times);
%       meanB = B0+mu*times; stdevB = sigma*sqrt(times);
%       figure(1); plot(times,B')
%                  hold on;
%                  plot(times,meanB,'k','linewidth',2)
%                  a = 2;
%                  plot(times,meanB-a*stdevB,'b','linewidth',2)
%                  plot(times,meanB+a*stdevB,'b','linewidth',2)
%                  hold off
%                  xlabel('t'); ylabel('B(t)')                   
%       figure(2); subplot(2,1,1); plot(times,mean(B),times,meanB); 
%                  xlabel('t'); ylabel('E[B(t)]'); legend('empirical','theoretical',2);                   
%       figure(2); subplot(2,1,2); plot(times,std(B),times,stdevB); 
%                  xlabel('t'); ylabel('stdv[B(t)]'); legend('empirical','theoretical',2);                   
%
%       nBins = 40; nFigure = 3;
%       empPdfGraphComp(B(:,end),@(x)normpdf(x,B0+mu*T,sigma*sqrt(T)),nBins,nFigure);
%       title('Histogram of B(T)')
%
dT = repmat(diff(times),M,1);
X = randn(size(dT));
B = cumsum([B0*ones(M,1)  ...
    (mu*dT + sigma*sqrt(dT).*X)],2);








