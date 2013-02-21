function moment = centralMomentGaussian(mu,sigma,n)
   %  centralMomentGaussian: central moment for Gaussian distribution
   %
   %   SYNTAX: moment = centralMomentGaussian(mu,sigma,n)
   %
   %   INPUT:   mu    : Average of the distribution
   %            sigma : Standard deviation
   %            n     : Order of the moment
   %
   %   STEPS
   %     1.- We create the quadrature function to be integrated
   %     2.- We define bounds for integration
   %     3.- Lastly, we quadrate the function via quadl
   %   CHECKS
   %     A.- The first moment is always zero
   %     B.- The second moment equals the variance
   %
   %   EXAMPLE:
   %     mu = 0; sigma = 1;
   %     N = 8;
   %     for n = 1:N;
   %        moment(n) = centralMomentGaussian(mu,sigma,n);
   %     end
   %     moment

   TOL        = 1e-6; % Automatically set precision target

   R          = 10;
   lowerBound = mu - R*sigma;
   upperBound = mu + R*sigma;
   x          = -100:0.1:100;

   moment     = quadl(@(x)quadfunction(x, mu, sigma, n), lowerBound, upperBound, TOL)
   plot(x, moment);
