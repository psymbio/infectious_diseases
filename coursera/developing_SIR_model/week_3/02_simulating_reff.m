function SIR_model(beta)
	% is infectious for 4 days
	gamma = 1/4;
	N = 10e5;
	S0 = 10e5 - 1;
	I0 = 1;
	R0 = 0;

	r_0 = beta/gamma;
	y0 = [S0 I0 R0];
	tspan = [0 100];
	dydt = @(t, y) [-beta*y(2)/N*y(1), -gamma*y(2) + beta*y(2)/N*y(1), gamma*y(2)]';
	% 1 2 3
	% S I R
	[t, y] = ode45(dydt, tspan, y0);

	hold on;
	plot(t, y(:, 1), 'b');
	plot(t, y(:, 2), 'r');
	plot(t, y(:, 3), 'g');
	plot(t, y(:, 1).*r_0, 'k');
	xlabel('Time');
	ylabel('Population');
	legend('S', 'I', 'R', 'r_eff');
end

% every person infects 1 person on avg every 2 days
beta = 1/2;
figure(1);
SIR_model(beta);
