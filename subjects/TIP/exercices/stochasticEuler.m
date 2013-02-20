t0     = 0;
T      = 10;   % Seconds
N      = 1000; % Subsamples
M      = 200;
r      = 0.1;
sigma  = 10;
t      = linspace(t0, t0+T, N+1);
deltaT = t(2) - t(1);
S      = zeros(M, N+1);
X      = randn(M,N);
for n = 1:N
   S(:, n+1) = S(:, n)*(1+r*deltaT)+S(:,n)*sigma.*X(:,n)*sqrt(deltaT);
end
