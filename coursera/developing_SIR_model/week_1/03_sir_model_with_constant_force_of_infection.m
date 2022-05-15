%{

We can use the SIR model to describe a disease that can be split into 3 states: susceptible ($S$), infected ($I$), or recovered (R). All those infected are infectious, and all those recovered are immune, so they cannot get the disease again.



One part of this model should already be very familiar to you! The transition from I to R is what we explored in etivity 1. The new addition is the susceptibles in compartment S. As you learnt in the lecture, depending on how many people in the population are infectious, susceptible people experience a force of infection $\lambda$ (*lambda*), which is the transition rate at which they become infected.
%}

%{
In this etivity, we are trying to simulate an outbreak of a new infectious disease that our population of 10$^{6}$ people has not been exposed to before. This means that we are starting with a single case, everyone else is susceptible to the disease, and no one is yet immune or recovered. This can for example reflect a situation where an infected person introduces a new disease into a geographically isolated population, like on an island, or even when an infections "spill over" from other animals into a human population. In terms of the initial conditions for our model, we can define: S = 10$^{6}$-1 = 999999, I = 1 and R = 0.
		
Now it's your turn to write and solve this model in R, assuming a constant force of infection of 0.2 days$^{-1}$. Like in the first coding etivity, the infection has an average duration of 10 days, but this time we want to run the model for 60 days. Try to write the whole code by yourself - but if you have trouble remembering how, just go back to the etivity 1 solution to check. We have also added some hints in the cell below, to help you remember which different parts are required. As you go along, it is good practice to add your own comments to every part, explaining what the code is for. When you're done writing the code and the comments, run it and print the output to double-check that everything works.
%}

lambda = 0.2;
% avg. duration of infection is 10 days
gamma = 1/10;
S0 = 10e5 - 1;
I0 = 1;
R0 = 0;
disp(S0);
y0 = [S0 I0 R0];
tspan = [0 60];

% S I R
% 1 2 3
dydt = @(t, y) [-lambda * y(1), lambda*y(1) - gamma*y(2), gamma*y(2)]';
[t, y] = ode45(dydt, tspan, y0);
hold on;
plot(t, y(:, 1), 'b');
plot(t, y(:, 2), 'r');
plot(t, y(:, 3), 'g');
xlabel('Time');
ylabel('Population');
legend('S', 'I', 'R');

disp('WHICH DAY DOES THE INFECTION PEAK?');
max_element = max(y(:, 2));
index = find(y(:, 2) == max_element);
disp(t(index));
