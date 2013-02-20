function h = graphicalComparison(X,pdf,nBins,nFig,normalized,varargin)
%graphicalComparison:
%
%  SYNTAX:
%   h = graphicalComparison(X,pdf,nBins,nFig,normalized,varargin)
%
%  EXAMPLE:
%   N = 1e4; X = randn(N,1);
%   pdf = @normpdf; mu = 0; sigma = 1;
%   nBins = 40; nFig = 1; 
%   normalized = 1;
%   h = graphicalComparison(X,pdf,nBins,nFig,normalized,mu,sigma);
% 
xMin = min(X);  % sample minimum
xMax = max(X);  % sample maximum
N = length(X);  % sample size
area = (xMax-xMin)*N/nBins;  % Average area
h = figure(nFig);
nPlot = 1e3;
xPlot = linspace(xMin,xMax,nPlot);
yPlot = feval(pdf,xPlot,varargin{:});
if normalized == 0
    hist(X,nBins);
    hold on;
        plot(xPlot,yPlot*area,'r','linewidth',2);
    hold off;
else
    [height,center] = hist(X,nBins);
    bar(center, height/area); 
    hold on;
        plot(xPlot,yPlot,'r','linewidth',2);
    hold off;
end
