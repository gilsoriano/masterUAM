function y = quadfunction(x, mu, sigma, n)
   y = (x - mu).^n.*normpdf(x, mu, sigma);

