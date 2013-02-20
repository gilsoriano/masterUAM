function norm = demoNormGaussian(mu,sigma,tol)
   %demoNormGaussian: normalization constant of Gaussian pdf
   %
   % SYNTAX: norm = demoNormGaussian(mu,sigma,tol)
   %
   % norm : Normalization of the pdf (should be equal to 1)
   % mu   : Average of the distribution
   % sigma : Standard deviation
   % tol   : Target absolute error of the norm estimate
   %
   % EXAMPLE 1:
   %   m = 0; s = 1;
   %   norm = demoNormGaussian(m,s)
   %
   % EXAMPLE 2:
   %   m = -2; s = 3; tol = 1e-10;
   %   format long
   %   norm = demoNormGaussian(m,s,tol)
   %   format short
   %
   if(nargin ==2)
      tol = 1e-6; % Automatically set precision target
   end
   %
   R = 10; % ~ norminv(1-eps); % Approximately infty for N(0,1) variable
   lower = mu - R*sigma; % lower limit of effective support interval
   upper = mu + R*sigma; % upper limit of effective support interval
   %
   % Calculate norm by numerical quadrature
   norm = quadl(@(x)integrandNormGaussian(x,mu,sigma),lower,upper,tol);

