format long;
h = 0.1;
t = 0:h:1;
x = zeros(size(t));
y = zeros(size(t));
x(1) = 1;
y(1) = 1;
[~, n] = size(t);

dxdt = @(t, x, y) y - t;
dydt = @(t, x, y) x + t;
for i = 1:n
	k1 = h*dxdt(t(i), x(i), y(i));
	l1 = h*dydt(t(i), x(i), y(i));
	k2 = h*dxdt(t(i) + 1/2*h, x(i) + 1/2*k1, y(i)+1/2*l1);
	l2 = h*dydt(t(i) + 1/2*h, x(i) + 1/2*k1, y(i)+1/2*l1);
	k3 = h*dxdt(t(i) + 1/2*h, x(i) + 1/2*k2, y(i)+1/2*l2);
	l3 = h*dydt(t(i) + 1/2*h, x(i) + 1/2*k2, y(i)+1/2*l2);
	k4 = h*dxdt(t(i) + h, x(i) + k3, y(i)+l3);
	l4 = h*dydt(t(i) + h, x(i) + k3, y(i)+l3);

	x(i+1) = x(i) + 1/6 * (k1 + 2*k2 + 2*k3 + k4);
	y(i+1) = y(i) + 1/6 * (l1 + 2*l2 + 2*l3 + l4);
	if t(i) == 0.1
		disp(x(i));
		disp(y(i));
	end
end

