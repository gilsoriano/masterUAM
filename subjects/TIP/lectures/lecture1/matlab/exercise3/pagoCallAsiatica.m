function pagoAsiatica = pagoCallAsiatica(GBM, r, T, K)
   % pagoCallAsiatica : calculo del pago de una call asiatica
   %
   % SYNTAX:
   %  GBM   : GBM
   %  r        : Interes libre de riesgo
   %  T        : Vencimiento
   %  K        : Strike
   %
   nTraj = size(GBM, 1);
   pagoAsiatica = zeros (nTraj, 1);
   for i = 1:nTraj
      pagoAsiatica(i) = exp(-r*T)*max(mean(GBM(i,:)) - K, 0);
   end
