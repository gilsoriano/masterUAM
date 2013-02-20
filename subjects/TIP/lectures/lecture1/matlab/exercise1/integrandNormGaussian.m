function y = integrandNormGaussian(x,mu,sigma)
   %integrandNormGaussian: integrando para demoNormGaussian
   %
   z = (x-mu)/sigma;
   y = exp(-0.5*z.*z)/(sqrt(2*pi)*sigma);

