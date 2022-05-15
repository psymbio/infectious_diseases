% rk2
h = 0.1; % step size
x = 0:h:1;
y = zeros(size(x));
y(1) = 1;
[~, n] = size(x);
dydt = @(x, y) x^2 + y;
for i = 1:n-1
	k1 = h * dydt(x(i), y(i));
	k2 = h * dydt(x(i+1), y(i) + k1);
	y(i+1) = y(i) + 1/2 * (k1 + k2);
end
plot(x, y);
xlabel('x');
ylabel('y');
title('rk4');
