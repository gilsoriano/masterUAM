function [precio,err] = precioCallAsiaticaMC(M,S0,K,r,T,sigma)

   %  precioCallAsiaticaMC: Call Asiatica por MC
   %
   %  Sintaxis:
   %
   %  [precio,err] = precioCallAsiaticaMC(M,S0,K,r,T,sigma)
   %
   %   S0: Valor inicial del subyacente
   %   K: Strike
   %   r: Tipo de interes anual
   %   T: Vencimiento de la opcion
   %   sigma : Volatilidad
   %   N: Numero de pasos en cada trayectoria
   %   M: Numero de trayectorias
   %
   %   precio: Estimacion MC del precio
   %   error: Estimacion MC del error en el precio
   %
   %  Ejemplo:
   %  S0 = 100; K = 110; r = 0.09; T = 1; sigma = 0.5;
   %  N = 52; M = 1e4;
   %  [precio,error] = precioCallAsiaticaMC(M,S0,K,r,T,sigma)
   %
   %

   S               = simGBM(S0, r, sigma, T, M);
   Send            = S(:,size(S,2));
   pagoAsiatica    = pagoCallAsiatica(Send, r, T, K);
   nTraj     = size(pagoAsiatica, 1);
   precio    = 1/nTraj*sum(pagoAsiatica);
   err       = 1/sqrt(nTraj)*std(pagoAsiatica);
