function[price,err]=Asiatica_Call_Aritmetica_BS_MC(S0,K,r,T,sigma,N,M)
% Asiatica_Call_Aritmetica_BS_MC: Call Asiática por MC
%
% Sintaxis:
%
% [precio,err] = Asiatica_Call_Aritmetica_BS_MC(S0,K,r,T,sigma,N,M)
%
% S0      : Valor inicial del subyacente
% K       : Strike
% r       : Tipo de interés anual
% T       : Vencimiento de la opción
% sigma   : Volatilidad
% N       : Número de pasos en cada trayectoria
% M       : Número de trayectorias
%
% precio  : Estimación MC del precio
% error   : Estimación MC del error en el precio
%
% Ejemplo:
% S0 = 100; K = 110; r = 0.09; T = 1; sigma = 0.5;
% N = 52; M = 1e4;
% [precio,error] = Asiatica_Call_Aritmetica_BS_MC(S0,K,r,T,sigma,N,M)
%
%
