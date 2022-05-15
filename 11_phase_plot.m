% http://matlab.cheme.cmu.edu/2011/08/09/phase-portraits-of-a-system-of-odes/
[x, y] = meshgrid(-2.5:0.2:2.5, -2.5:0.1:2.5);
% center type stable point
xdot = -y;
ydot = x;
% x y
% 1 2
dydt = @(t, y) [-y(2), y(1)]';
figure(1);
hold on;
quiver(x, y, xdot, ydot);
for y0 = -1:0.1:1
	[t, y] = ode45(dydt, [-2.5 2.5], [y0/2 y0]);
	plot(y(:, 1), y(:, 2));
end
xlabel('x');
ylabel('y');
title('CENTER TYPE STABLE PLOT');


[x, y] = meshgrid(-2.5:0.1:2.5, -2.5:0.1:2.5);

% unstable spiral/ spiral source
xdot = x - y;
ydot = x + y;

% x y
% 1 2
dydt = @(t, y) [y(1) - y(2), y(1) + y(2)]';
figure(2);
hold on;
quiver(x, y, xdot, ydot);
for y0 = -1:0.1:1
	[t, y] = ode45(dydt, [-1 1], [y0/2, y0]);
	plot(y(:, 1), y(:, 2));
end
xlabel('x');
ylabel('y');
title('UNSTABLE SPIRAL');
hold off;

[x, y] = meshgrid(-2.5:0.1:2.5, -2.5:0.1:2.5);

% stable spiral
xdot = -x + y;
ydot = -x - y;
% x y
% 1 2
dydt = @(t, y) [-y(1) + y(2), -y(1) - y(2)]';
figure(3);
hold on;
quiver(x, y, xdot, ydot);

% y0 basically controls the number of lines 
for y0 = -1:0.1:1
       [t, y] = ode45(dydt, [-5 5], [y0/2 y0]);
       plot(y(:, 1), y(:, 2));
end
xlabel('x');
ylabel('y');
title('STABLE SPIRAL');
hold off;

% sink node
[x, y] = meshgrid(-2.5:0.1:2.5, -2.5:0.1:2.5);
xdot = -x;
ydot = -4*y;
figure(4);
hold on;
quiver(x, y, xdot, ydot);
for y0 = -1:0.1:1
	[t, y] = ode45(dydt, [-1 1], [y0/2 y0]);
	plot(y(:, 1), y(:, 2));
end
xlabel('x');
ylabel('y');
title('SINK NODE/STABLE NODE');
hold off;
