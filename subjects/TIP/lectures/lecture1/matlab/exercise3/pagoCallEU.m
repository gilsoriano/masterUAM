function pagoEU = pagoCallEU(GBMend, r, T, K)
   %  pagoCallEU : cálculo del pago de una call europea
   %
   %  SYNTAX:
   %   GBMend   : Valor GBM al vencimiento para diferentes trayectorias
   %   r        : Interés libre de riesgo
   %   T        : Vencimiento
   %   K        : Strike
   %
   pagoEU = exp(-r*T)*max(GBMend - K, 0);
