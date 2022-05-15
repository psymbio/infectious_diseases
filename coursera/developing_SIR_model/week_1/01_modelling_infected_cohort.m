%{
To start, it is useful to code what we know about the situation we want to model. We are looking at a cohort of 106 currently infected people, and no one has recovered so far. The average duration of infection is 10 days. The question we want to answer is how many people will recover from the infection over a 4-week period.
%}
function IR_Model(recovery_rate)
	I0 = 1000000;
	R0 = 0;
	
	if ~exist('recovery_rate', 'var')
		recovery_rate = 0.1
	end
	tspan = [0 4*7];
	y0 = [I0 R0];
	dydt = @(t, y) [-recovery_rate*y(1), recovery_rate*y(1)];
	[t, y] = ode45(dydt, tspan, y0);

	hold on;
	plot(t, y(:, 1), 'r');
	plot(t, y(:, 2), 'g');
end

disp('question 1');
figure(1);
IR_Model(0.1);
disp('question 2');
figure(2);
IR_Model(0.5);
disp('question 3');
figure(3);
IR_Model(0.05);

%{
Answer: if the rate is higher ($\gamma$ = 0.5), we can see that infected people recover more quickly: it takes less than 2 days for half of the infected cohort to recover, and by around 8 days, nearly everyone has recovered. A lower rate ($\gamma$ = 0.05) on the other hand corresponds to a slower transition: it takes around 14 days for half of infected people to move into the $R$ compartment, and by the end of our 4 week follow-up around a quarter of people still have not recovered.
%}
