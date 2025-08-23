%% Estimating numerical first order derivatives for forward difference methods

clear all;
close all;

x = [0:0.1:1]';
y = x.^3; %dy/dx = 3x^2; d2y/dx2 = 6x

n = length(x);

figure(1);
%plot(x, y, '-b', 'linewidth', 2);
plot(x, y, '-ob', 'linewidth', 2);
hold on;
xlabel('x');
ylabel('\rho=x^3');
set(gca, "linewidth", 2, "fontsize", 14)

% gradient
yp = 6*x; % Analytical expression

%yp_forwardDifference = zeros(size(y));
yp_central2ndOrderDerivative = zeros(size(y));

%yp_n1(1, 1) = (y(2, 1) - y(1, 1)) / (x(2, 1) - x(1, 1));
%yp_n1(n, 1) = (y(n, 1) - y(n-1, 1)) / (x(n, 1) - x(n-1, 1));

for i = 2 : length(y)-1
  %yp_forwardDifference(i, 1) = (y(i+1, 1) - y(i, 1)) / (x(i+1, 1) - x(i, 1));
  yp_central2ndOrderDerivative(i, 1) = (y(i+1, 1) - (2*y(i, 1)) + y(i-1, 1)) / (x(i+1, 1) - x(i, 1)).^2;
end

figure(2);
hold on;
plot(x(2:n-1), yp(2:n-1), '-b', 'linewidth', 2);
%plot(x(2:n-1), yp_forwardDifference(2:n-1), '--om', 'linewidth', 2);
plot(x(2:n-1), yp_central2ndOrderDerivative(2:n-1), 'ov', 'linewidth', 2);
%legend('analytical', 'forwardDifference', 'centraldifference', 'location', 'northwest');
legend('analytical', '2ndOrderCentralDifference', 'location', 'northwest');
hold on;
xlabel('x');
ylabel('d^2\rho/dx^2=6x');
box on;
set(gca, "linewidth", 2, "fontsize", 14)
hold off;
