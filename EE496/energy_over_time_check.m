% ***Plot energy over time with and without PI controller ***
% All values taken from Simlink model through "To workspace" block
t = out.Fex_no.time;
power = out.Fex.signals.values .* out.vel.signals.values; % Instantaneous power at each time step
energy = cumtrapz(t, power); % Define energy

power_no = out.Fex_no.signals.values .* out.vel_no.signals.values; % Power with no controller
energy_no = cumtrapz(t, power_no); % Energy with no controller

% Plot
figure;
plot(t, energy_no, 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Captured Energy (Joules)');
title('Energy Captured Over Time without PI Controller');
grid on;

figure;
plot(t, energy, 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Captured Energy (Joules)');
title('Energy Captured Over Time with PI Controller');
grid on;


