%{
At the start, there are 10$^6$ infected people. No one has recovered or died yet. The recovery rate $\gamma$ is 0.1 days$^{-1}$ and the mortality rate $\mu$ is 0.2 days$^{-1}$. Again we want to model the course of the infection over 4 weeks.
%}

% 1 2 3
% I R M
N = 10e6;
R0 = 0;
M0 = 0;
I0 = N;
y0 = [I0 R0 M0];
gamma = 0.1;
mu = 0.2;
tspan = [0 4*7]; % convert to days as well
dydt = @(t, y) [-mu*y(1) - gamma*y(1), gamma*y(1), mu*y(1)]';
[t, y] = ode45(dydt, tspan, y0);
hold on;
plot(t, y(:, 1), 'r');
plot(t, y(:, 2), 'b');
plot(t, y(:, 3), 'g');
xlabel('Time');
ylabel('Population');
legend('I', 'M', 'R');

[n, ~] = size(y);
disp('Proportion of people that died before recovery');
disp(y(n, 3) / N);
disp('CFR');
disp(0.2 / (0.2 + 0.1));
disp('CFR and Proportion match');
disp('mu for CFR to be 0.5 assuming gamma is 0.1 is 0.1')
