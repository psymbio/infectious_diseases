
function [prevalence, curr_pop_infected] = neonatal_SIR(p_vacc, sigma)
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

	% immunity if permanent then it is 0
	if ~exist('sigma', 'var')
		sigma = 0;
	end

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
	% fig = figure;
	plot(t, y(:, 1), 'b');
	plot(t, y(:, 2), 'r');
	plot(t, y(:, 3), 'g');
	xlabel('Time');
	ylabel('Population');
	legend('S', 'I', 'R');
	% close(fig);
	hold off;

	disp('endemic prevalance: (proportion of people having the disease at equilibrium)');

	equi_time_stamps = find(t > 2);
	equi_time_stamp = equi_time_stamps(1);
	% disp(equi_time_stamp);
	% disp('number of people with the disease now: ');
	curr_pop_infected = y(round(equi_time_stamp), 2);
	prevalence = curr_pop_infected/N;
end

% question 2: proportion of new borns to be vaccinated to reduce the prevalence by half.
% basically just run the neonatal_SIR till prevalence is below 0.017 / 2
disp('QUESTION 2');
for p_vacc_curr = 0:0.1:1
	[prevalence_curr, curr_pop_infected] = neonatal_SIR(p_vacc_curr);
	disp(prevalence_curr);
	if prevalence_curr < 0.017 / 2
		disp('p_vacc should be: ')
		disp(p_vacc_curr);
		disp('for the endemic prevalence to reduce by half');
		break
	end
end

% question 3: possible to eliminate disease with p_vacc
% basically just run the neonatal_SIR till prevalence is 0

% not possible to run because what is less than 0?

disp('QUESTION 3');
for p_vacc_curr = 0:0.1:1-0.1
	[prevalence_curr, curr_pop_infected] = neonatal_SIR(p_vacc_curr);
	disp(curr_pop_infected);
	if curr_pop_infected < 1
		disp('p_vacc should be: ')
		disp(p_vacc_curr);
		disp('to eliminate the disease');
		break
	end
end

% question 4: avg. duration of immunity is 1 year
% how would this impact prevalence given p_vacc is the one you took out for 
% when endemic prevalence was reduced to 1/2 (question 2)
disp('QUESTION 4');
disp('new model with immnity for only 1 year, number of infected people at equi');
[q4_prevalence_curr, q4_curr_pop_infected] = neonatal_SIR(0.5, 1);
disp(q4_curr_pop_infected);
disp('old baseline model, number of infected people at equi');
[q1_prevalence_curr, q1_curr_pop_infected] = neonatal_SIR(0, 0);
disp(q1_curr_pop_infected);


% question 5: given this new situation is it possible to have a neonatal vaccine to save the day
disp('QUESTION 5');
flag_saved_the_day = 0;
for p_vacc_curr = 0:0.1:1
	[prevalence_curr, curr_pop_infected] = neonatal_SIR(p_vacc_curr, 1);
	if curr_pop_infected < 1
		disp('p_vacc should be:');
		disp(p_vacc_curr);
		disp('to eliminate the disease');
		flag_saved_the_day = 1;
		break
	end
end
if flag_saved_the_day == 0
	disp("it's not possible to save the day");
	disp("currently the number of people infected are: ")
	disp(curr_pop_infected);
end

% question 6: an adjuvant is given with the vaccine to boost immunity to 2.5 years on avg.
% here sigma = 1/2.5;
% would it be possible to get rid of the disease
disp('QUESTION 6');
sigma = 1/2.5;
flag_saved_the_day = 0;
for p_vacc_curr = 0:0.1:1
	[prevalence_curr, curr_pop_infected] = neonatal_SIR(p_vacc_curr, sigma);
	if curr_pop_infected < 1
		disp('p_vacc should be:');
		disp(p_vacc_curr);
		disp('to eliminate the disease');
		flag_saved_the_day = 1;
		break
	end
end
if flag_saved_the_day == 0
	disp("it's not possible to save the day");
	disp("currently the number of people infected are: ")
	disp(curr_pop_infected);
end
