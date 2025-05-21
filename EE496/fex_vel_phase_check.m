% Check Fex and Velocity are in phase with peak frequency for WEC
omega_pk = 0.7;
omega_max_energy = 0.81441; % switch to this freq for testing
s = 1i * omega_pk;

% SS of WEC model
A = WEC.hydroData.import.A_ss;
B = WEC.hydroData.import.B_ss;
C = WEC.hydroData.import.C_ss;
D = WEC.hydroData.import.D_ss;

G = s * (C * ((s * eye(size(A)) - A) \ B) + D); % Convert SS to transfer function

Z_wec = 1 / G;
re_wec = real(Z_wec);
im_wec = -imag(Z_wec) * omega_pk;

% Magnitude and phase of G
mag = abs(G);
phi = angle(G);

% Sine wave
t = linspace(0, 20, 1000);
Fex_check = sin(omega_pk * t);
v = mag * sin(omega_pk * t + phi);

plot(t, Fex_check, 'b', t, v, 'r--');
legend('Fex', 'velocity'); xlabel('Time'); ylabel('Amplitude');
title(sprintf('Phase diff = %.1f', phi * 180/pi));