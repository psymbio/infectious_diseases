% this is example 1 of book: Numerical Methods for Engineers 7th Edition, chapter 25, page 710
% Euler's Method

% solved programmatically

% initial conditions x = 0 and y = 1
% step size 0.5
h = 0.5; % step size
x = 0:h:10; % extending an array from 0 to 1 with a stepsize of h
y = zeros(size(x)); % initializing y to zeros
actuals = zeros(size(x));
y(1) = 1; % store initial value of y
[~, n] = size(x);

% disp(size(x)); % outputs 1 10001 so we only store the second value into n
f_xy = @(x, y) -2*x^3 + 12*x^2 - 20*x + 8.5; % anonymous functions in MATLAB, can only handle a single executable statement
integrated = @(x, y) -x^4/2 + 4*x^3 - 10*x^2 + 8.5*x + 1;

for i = 1:n-1
	% go till n-1 because you are storing the values of y(i+1)
	actual = integrated(x(i), y(i));
	actuals(i) = actual;
	phi = f_xy(x(i), y(i));
	y(i+1) = y(i) + phi * h;
	fprintf('Euler: %.4f Actual: %.4f Error: %.4f\n', y(i), actual, actual - y(i));
end

disp(size(x));
disp(size(y));
plot(x, y, "r--", "LineWidth", 2);
hold on;
plot(x, actuals, "g--", "LineWidth", 3);
