function [precio,err] = precioCallEUMC(M,S0,K,r,T,sigma)
   %  precioCallEU_MC: Precio de una call europea mediante MC
   %
   %   EJEMPLO 1:
   %   S0 = 100; K = 90; r = 0.03; T = 2; sigma = 0.4;
   %   M = 1e4;
   %   [precio,err] = precioCallEUMC(M,S0,K,r,T,sigma)
   %   blsprice(S0,K,r,T,sigma)
   %
   %   EJEMPLO 2:
   %   S0 = 100; K = 90; r = 0.03; T = 2; sigma = 0.4;
   %   M = 1e4; B = 10000;
   %   for b =1:B
   %   [precio(b), err(b)] = precioCallEUMC(M,S0,K,r,T,sigma);
   %   end
   %
   %
   %   La distribucion de precios estimados por MC es Gaussiana
   %   % con los parametros
   %   media = mean(precio); desvEst = mean(err);
   %   figure(1); nBins = 40; hist(precio,nBins);
   %   nPlot = 1e3; a = 4;
   %   xPlot = linspace(media-a*desvEst,media+a*desvEst,nPlot);
   %   factor = (max(precio)-min(precio))*B/nBins;
   %   yPlot = factor*normpdf(xPlot,media,desvEst);
   %   hold on; plot(xPlot,yPlot,'r','linewidth',2); hold off;
   %
   S         = simGBM(S0, r, sigma, T, M);
   Send      = S(:,size(S,2));
   pagoEU    = pagoCallEU(Send, r, T, K);
   nTraj     = size(pagoEU, 1);
   precio    = 1/nTraj*sum(pagoEU);
   err       = 1/sqrt(nTraj)*std(pagoEU);
