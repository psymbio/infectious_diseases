h = 0.01; % step size
x = 0:h:1;

y = zeros(size(x));
y_1 = zeros(size(x));
actuals = zeros(size(x));
y(1) = 1;
y_1(1) = 1;

[~, n] = size(x);

f_xy = @(x, y) x;
integrated = @(x, y) x^2/2 + 1;

error_max = 0.001;
max_iter = 100;
for i = 1:n-1
	actual = integrated(x(i), y(i));
	actuals(i) = actual;
	
	phi = f_xy(x(i), y(i));
	y(i+1) = y(i) + phi * h;

	y_1(i+1) = y(i) + h/2 * (f_xy(x(i),y(i)) + y(i+1));
	iter = 0;
	if abs(y_1(i+1) - y(i+1)) > error_max && iter < max_iter
		y(i+1) = y1(i+1)


end
plot(x, y, "r--");
hold on;
plot(x, actuals, "g--");
