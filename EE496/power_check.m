%% Peak Power Capture
omega = linspace(0.1, 10, 500);
jw = 1i * omega;

% Assumed Wave Excitation force from Simulink model where peak = 1
Fex = 1;

% Mass Spring Damper
G = jw ./ (m * jw.^2 + b * jw + k);

% Velocity V = G * F_ex
V = G * Fex;

% Phase difference
phase_difference = angle(Fex) - angle(V);

% Power capture
P = 0.5 * abs(Fex) .* abs(V) .* cos(phase_difference);  % watts

% Plotting
figure;

% Subplot 1: Power Capture
subplot(2, 1, 1);
plot(omega, P, 'LineWidth', 2);
xlabel('Frequency w (rad/s)');
ylabel('Captured Power P (W)');
title('Power Capture vs a range of Frequencies');
grid on;

% Subplot 2: Phase Difference
subplot(2, 1, 2);
plot(omega, phase_difference, 'LineWidth', 2);
xlabel('Frequency w (rad/s)');
ylabel('Phase Difference');
title('Phase Difference between F_{ex} and V', 'Interpreter', 'tex');
grid on;

