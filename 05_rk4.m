format long;
h = 0.05;
x = 0:h:0.1;
y = zeros(size(x));
y(1) = 2;
[~, n] = size(x);
dydt = @(x, y) y - x;
for i = 1:n-1
	k1 = h * dydt(x(i), y(i));
	k2 = h * dydt(x(i) + 1/2 * h, y(i) + 1/2 * k1);
	k3 = h * dydt(x(i) + 1/2 * h, y(i) + 1/2 * k2);
	k4 = h * dydt(x(i) + h, y(i) + k3);
	y(i+1) = y(i) + 1/6 * (k1 + 2*k2 + 2*k3 + k4);
end
disp(y);
