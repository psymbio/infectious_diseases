clc;
clear all;
close all;

% infection rate is 0.4 per day
beta = 0.4 * 365; % per year
% recovery rate is 0.2 per day
gamma = 0.2 * 365;
% immunity means how long a person can stay in the recovery compartment before becoming susceptible
% avg. duration of immunity is 10 years
% thus in a year it's 1/10
% rate by which the people move from R to S is sigma
sigma = 1 / 10;

% changing sigma to reflect fast waning of immunity
sigma = 1 / 2;

N = 1e6;
I = 1;
S = N - I;
R = N - (I + S);
y0 = [S I R];
tspan = [0 200];
% fast waning tspan
tspan = [0 20];
% S I R
% 1 2 3
dydt = @(t, y) [-beta*y(2)/N*y(1) + sigma*y(3), beta*y(2)/N*y(1) - gamma * y(2), gamma * y(2) - sigma*y(3)]';
[t, y] = ode45(dydt, tspan, y0);

hold on;
plot(t, y(:, 1), 'b');
plot(t, y(:, 2), 'r');
plot(t, y(:, 3), 'g');
xlabel('Time');
ylabel('Population');
legend('Susceptible', 'Infected', 'Recovered');
