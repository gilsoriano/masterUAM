function [I, Sx] = quadfunction(S0, K, r, T, sigma, X)
%  quadfunction: Ingrando para la cuadratura del problema 3
%
%  SINTAXIS:
%   quadfunction(S0, K, r, sigma, T, x)
%
%   S0    : Precio inicial del subyacente
%   K     : Precio de ejercicio (Strike)
%   r     : tipo de interés libre de riesgo
%   T     : tiempo de vencimiento
%   sigma : volatilidad
%   x     : VA ~ N(0,1)
%
%

% Primeramente escribimos el modelo de Black-Scholes
   Sx = S0*exp((r-0.5*sigma^2)*T+sigma*sqrt(T)*X);
   I = (Sx - K).*normpdf(X);
