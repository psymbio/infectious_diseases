function SIR_model()
        % is infectious for 4 days
        beta = 0.4*365;
        gamma = 0.2*365;
        
        % avg lifespan is 70 years
        % 70*365 days
        % 1/70*365 in one day
        mu = 1/70;
        b = mu;
        % 400 years 
        tspan = 0:1:400;

        N = 10e5;
        S0 = 10e5 - 1;
        I0 = 1;
        R0 = 0;
        r_0 = beta/gamma;
        y0 = [S0 I0 R0];
        dydt = @(t, y) [-beta*y(2)/N*y(1) - mu*y(1) + b*N, -gamma*y(2) + beta*y(2)/N*y(1) - mu*y(2), gamma*y(2) - mu*y(3)]';
        % 1 2 3
        % S I R
        [t, y] = ode45(dydt, tspan, y0);
        hold on;
        plot(t, y(:, 1), 'b');
        plot(t, y(:, 2), 'r');
        plot(t, y(:, 3), 'g');
        xlabel('Time');
        ylabel('Population');
        legend('S', 'I', 'R', 'r_eff');
	xlim([0 1]);
end

SIR_model()
