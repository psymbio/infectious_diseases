% question 1: model it and find the endemic prevalence

% infection rate is 1 day 1 person
% people infected in a year
beta = 1 * 365;

% avg. duration of infection is 20 days
gamma = 365 * 1/20;

% avg. lifespan of population is 3 years 
% in a year it's 1/3
mu = 1 / 3;

% total population size in the country is 300000
N = 300000;

% disease is endemic but relatively rare in the population

% p_vacc is given to a proportion of newborn animals
% neonatal vaccination


% doubt: how is birth rate given in the question?
birth_rate = 1/3;

p_vacc = 0.1;

% immunity if permanent then it is 0
sigma = 0;

% these initial conditions don't really matter
% just because the question said that the disease is rare
% the infected population is assumed to be 5%
I = 0.05 * N;
S = 0.5 * N;
R = 0.45 * N;

tspan = [0 5];
y0 = [S I R];

% S I R
% 1 2 3
dydt = @(t, y) [-beta*y(2)/N*y(1) - mu*y(1) + (1-p_vacc)*birth_rate*N + sigma*y(3), beta*y(2)/N*y(1) - gamma*y(2) - mu*y(2), gamma*y(2) - mu*y(3) + p_vacc*birth_rate*N - sigma*y(3)]';

[t, y] = ode45(dydt, tspan, y0);

hold on;
plot(t, y(:, 1), 'b');
plot(t, y(:, 2), 'r');
plot(t, y(:, 3), 'g');
xlabel('Time');
ylabel('Population');
legend('S', 'I', 'R');

disp('endemic prevalance: (proportion of people having the disease at equilibrium)');

% this is the precision value

diff_max = 3;
n = size(y(:, 1));
equi_time_stamp = 0;
for i = 1:n-1
	% disp(abs(y(i+1, 1) - y(i, 1)));
	if abs(y(i+1, 1) - y(i, 1)) < diff_max
		equi_time_stamp = i;
		break
	end
end

%% Important note: this approach will not be adopted because of the differences in results
%% Instead we shall just opt to see in the graph a time_stamp where the popualtions have stabilized
%% equi_time_stamps = find(t > 2);
%% and equi_time_stamp = equi_time_stamps(1);

disp(y(equi_time_stamp, 2)/N);
