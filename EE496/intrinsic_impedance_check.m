%% Intrinsic Impedance check

% Mass Spring Damper values
m = 1;
b = 5;
k = 6;

% Frequency in rad/s (change accordingly)
w = 2; % Tested values: 0.1, 0.5, 1, `1.2, 1.5, 2

% Compute intrinsic impedance Z = b + j(mw - k/w)
Zw_real = b;  % Real part
Zw_imag = 1i * ((m * w) - (k / w));  % Imaginary part
Zw_intrinsic = Zw_real + Zw_imag;

% Complex conjugate of impedance (optimal matching target)
Zw_conj = conj(Zw_intrinsic);  % b - j(mw - k/w)

Zu_conj = (2 * b) - Zw_intrinsic;

%C(jw) = Kp - j * Ki/w
Kpz = real(Zu_conj);
Kiz = -(imag(Zu_conj) * w);

fprintf('Complex conjugate of intrinsic impedance for w = %.4f gives:\n', w);
fprintf('Kp = %.4f\n', Kpz);
fprintf('Ki = %.4f\n', Kiz);