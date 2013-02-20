% demoCentralMomentGaussianMC
normalized = 1; nBins = 40; % Number of bins for histogram
B = 1e3;
% number of samples generated
M = 1e4;
% size of each sample
mu = 0.0; sigma = 1.0;
X = mu + sigma * randn(B,M); % B samples of size M
for n=1:16
   % B MC estimates of central moment from sample of size M
   moment = mean((X-mu).^n,2);
   avg_moment(n) = mean(moment);
   std_moment(n) = std(moment);
   graphicalComparison(moment,@normpdf,nBins,n,...
      normalized,avg_moment(n),std_moment(n))
   title(sprintf('Moment of order %d',n));
end
avg_moment
