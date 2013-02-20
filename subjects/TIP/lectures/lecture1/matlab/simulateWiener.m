function W = simulateWiener(M,times)
%simulateWiener: Simulate Wiener Process 
% 
% EXAMPLE 1: 
%       T = 2; N = 100; times = linspace(0,T,N);
%       M = 150;
%       W = simulateWiener(M,times);
%       figure(1); plot(times,W'); xlabel('t'); ylabel('W(t)')
%
% EXAMPLE 2: 
%       T = 2; N = 100; times = linspace(0,T,N);
%       M = 1000;
%       W = simulateWiener(M,times);
%       meanW = zeros(size(times)); stdevW = sqrt(times);
%       figure(1); plot(times,W')
%                  hold on;
%                  plot(times,meanW,'k','linewidth',4)
%                  a = 2;
%                  plot(times,meanW-a*stdevW,'b','linewidth',2)
%                  plot(times,meanW+a*stdevW,'b','linewidth',2)
%                  hold off
%                  xlabel('t'); ylabel('W(t)')                   
%       figure(2); subplot(2,1,1); plot(times,mean(W),times,meanW); 
%                  xlabel('t'); ylabel('E[W(t)]'); legend('empirical','theoretical',2);                   
%       figure(2); subplot(2,1,2); plot(times,std(W),times,stdevW); 
%                  xlabel('t'); ylabel('stdv[W(t)]'); legend('empirical','theoretical',2);                   
%
%       nFigure = 3; nBins = 40; 
%       empPdfGraphComp(W(:,end),@(x)normpdf(x,0,sqrt(T)),nBins,nFigure);
%       title('Histogram of W(T)')
%
dT = repmat(diff(times),M,1);
X = randn(size(dT));
W = cumsum([zeros(M,1) sqrt(dT).*X],2);









