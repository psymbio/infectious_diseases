beta = 1; % beta = p * c;
% beta is the infection rate

% force of infection (lambda) = p*c * I/N
%			      = beta * I/N
gamma = 0.1; % recovery rate
% here gamma doesn't mean that people are being cured
% it means that they've naturally recovered from the disease
% if you were to model the cure you could take another constant 
% and add it to gamma saying that is the the rate of people getting cured by the cure 
% parallel to the people getting cured naturally

tspan = [0 60];
N = 10^5;
I = 1;
S = N - I;
R = N - (I + S);
y0 = [S I R]; % initial conditions

% S I R
% 1 2 3
dydt = @(t, y) [-beta * y(2)/N * y(1), beta * y(2)/N * y(1) - gamma*y(2), gamma*y(2)];

[t, y] = ode45(dydt, tspan, y0);

hold on;
plot(t, y(:, 1), 'r');
plot(t, y(:, 2), 'g');
plot(t, y(:, 3), 'b');
xlabel('Time');
ylabel('Population');
title('Disease Dynamics');
legend('Susceptible', 'Infected', 'Recovered');

disp('After how many days does the epidemic peak?');
max_infected = max(y(:, 2));
index = find(y(:, 2) == max_infected);
disp(t(index));

disp('What is the peak prevalence');
disp(max_infected/N);

